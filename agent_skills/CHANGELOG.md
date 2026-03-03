
# Changelog

All notable changes to this repository are documented in this file.

## Unreleased

### 🚀 Added

- Added a root-level `install.sh` to vendor `skills/` and `agent_skills/` into other repositories
- Added `agent_skills/README_TEMPLATE.md` as the canonical README template for `agent-creator`
- Added `readme.txt` with a minimal “how this repo works” quick-start

### 🔄 Changed

- Expanded `agent_skills/README.md` with install/update instructions and clarified template usage
- Updated `.github/pull_request_template.md` to link to `agent_skills/README.md`
- Standardized skill frontmatter `metadata.author` to `jackonedev` across core skills
- Moved the README template out of the repo root (now shipped as `agent_skills/README_TEMPLATE.md`)

### ⚠️ Deprecated

### ❌ Removed

### 🐞 Fixed

- Ignored `.vscode/` in `.gitignore` to avoid committing editor-specific settings

### 🔐 Security
