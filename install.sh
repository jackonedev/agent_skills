#!/usr/bin/env bash

set -euo pipefail

REPO_URL="https://github.com/jackonedev/agent_skills.git"
REPO_OWNER="jackonedev"
REPO_NAME="agent_skills"

usage() {
  cat <<'EOF'
Install Agent Skills into an existing repository (no git clone).

This script downloads a zip archive from GitHub and vendors these folders into a target repo:
- skills/
- agent_skills/

Usage:
  install.sh [--dest <path>] [--ref <git-ref>] [--overwrite]

Options:
  --dest <path>     Target directory (default: current directory)
  --ref <git-ref>   Tag/branch/commit to install (default: latest GitHub release tag; fallback: master)
  --overwrite       Replace existing skills/ and agent_skills/ instead of backing them up
  -h, --help        Show help

Examples:
  # Install latest release into current directory
  curl -fsSL https://raw.githubusercontent.com/jackonedev/agent_skills/master/agent_skills/install.sh | bash

  # Install a specific tag
  curl -fsSL https://raw.githubusercontent.com/jackonedev/agent_skills/master/agent_skills/install.sh | bash -s -- --ref v1.0.0

  # Install into a specific repo path
  curl -fsSL https://raw.githubusercontent.com/jackonedev/agent_skills/master/agent_skills/install.sh | bash -s -- --dest /path/to/repo
EOF
}

need_cmd() {
  command -v "$1" >/dev/null 2>&1 || {
    echo "Missing required command: $1" >&2
    exit 1
  }
}

fetch_latest_release_tag() {
  local api="https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/releases/latest"

  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$api" 2>/dev/null | sed -n 's/.*"tag_name"[[:space:]]*:[[:space:]]*"\([^"]\+\)".*/\1/p' | head -n 1
  elif command -v wget >/dev/null 2>&1; then
    wget -qO- "$api" 2>/dev/null | sed -n 's/.*"tag_name"[[:space:]]*:[[:space:]]*"\([^"]\+\)".*/\1/p' | head -n 1
  else
    echo ""
  fi
}

download_zip() {
  local ref="$1"
  local out="$2"
  local url="https://github.com/${REPO_OWNER}/${REPO_NAME}/archive/${ref}.zip"

  if command -v curl >/dev/null 2>&1; then
    curl -fL "$url" -o "$out"
  else
    wget -O "$out" "$url"
  fi
}

backup_or_remove_dir() {
  local target="$1"
  local overwrite="$2"

  if [ ! -e "$target" ]; then
    return 0
  fi

  if [ "$overwrite" = "true" ]; then
    rm -rf "$target"
    return 0
  fi

  local ts
  ts="$(date +%Y%m%d%H%M%S)"
  mv "$target" "${target}.backup.${ts}"
}

main() {
  local dest="."
  local ref=""
  local overwrite="false"

  while [ $# -gt 0 ]; do
    case "$1" in
      --dest)
        dest="$2"
        shift 2
        ;;
      --ref)
        ref="$2"
        shift 2
        ;;
      --overwrite)
        overwrite="true"
        shift
        ;;
      -h|--help)
        usage
        exit 0
        ;;
      *)
        echo "Unknown option: $1" >&2
        echo "" >&2
        usage >&2
        exit 1
        ;;
    esac
  done

  need_cmd unzip
  if ! command -v curl >/dev/null 2>&1 && ! command -v wget >/dev/null 2>&1; then
    echo "Missing required command: curl or wget" >&2
    exit 1
  fi

  dest="$(cd "$dest" && pwd)"

  if [ -z "$ref" ]; then
    ref="$(fetch_latest_release_tag || true)"
    if [ -z "$ref" ]; then
      ref="master"
    fi
  fi

  echo "Installing Agent Skills"
  echo "- Source: ${REPO_URL}"
  echo "- Ref:    ${ref}"
  echo "- Dest:   ${dest}"

  local tmpdir zipfile
  tmpdir="$(mktemp -d)"
  zipfile="${tmpdir}/agent_skills.zip"

  trap 'rm -rf "$tmpdir"' EXIT

  download_zip "$ref" "$zipfile"
  unzip -q "$zipfile" -d "$tmpdir"

  local extracted_root
  extracted_root="$(find "$tmpdir" -mindepth 1 -maxdepth 1 -type d -name "${REPO_NAME}-*" | head -n 1)"
  if [ -z "$extracted_root" ] || [ ! -d "$extracted_root" ]; then
    echo "Failed to locate extracted archive root." >&2
    exit 1
  fi

  if [ ! -d "${extracted_root}/skills" ] || [ ! -d "${extracted_root}/agent_skills" ]; then
    echo "Archive missing expected folders (skills/ and agent_skills/)." >&2
    exit 1
  fi

  backup_or_remove_dir "${dest}/skills" "$overwrite"
  backup_or_remove_dir "${dest}/agent_skills" "$overwrite"

  cp -R "${extracted_root}/skills" "${dest}/skills"
  cp -R "${extracted_root}/agent_skills" "${dest}/agent_skills"

  echo ""
  echo "Installed:"
  echo "- ${dest}/skills"
  echo "- ${dest}/agent_skills"
  echo ""
  echo "Next steps (run from your repo root):"
  echo "  ./skills/skill-sync/assets/sync.sh"
  echo "  ./skills/setup.sh --copilot   # or --all"
}

main "$@"
