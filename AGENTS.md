 # Repository Guidelines

## How to Use This Guide

- Start here for cross-project norms. current_repo is a monorepo as a component for multi-project.
- current_repo may have multiple components, and each one has an `AGENTS.md` file with specific guidelines (e.g., `api/AGENTS.md`, `ui/AGENTS.md`).
- Component docs override this file when guidance conflicts.

## Available Skills

Use these skills for detailed patterns on-demand:

### Generic Skills (Any Project)
| Skill | Description | URL |
|-------|-------------|-----|
| Fixing bugs, implementing features, refactoring, or investigating existing code flows | `codenavi` | [SKILL.md](skills/codenavi/SKILL.md) |
| Writing, modifying, or reviewing code implementations | `coding-guidelines` | [SKILL.md](skills/coding-guidelines/SKILL.md) |
| Writing, reviewing, or editing documentation | `docs-writer` | [SKILL.md](skills/docs-writer/SKILL.md) |

### current_project-Specific Skills
| Skill | Description | URL |
|-------|-------------|-----|
| `skill-creator` | Create new AI agent skills | [SKILL.md](skills/skill-creator/SKILL.md) |

### Auto-invoke Skills

When performing these actions, ALWAYS invoke the corresponding skill FIRST:

| Action | Skill |
|--------|-------|
| After creating/modifying a skill | `skill-sync` |
| Creating new skills | `skill-creator` |
| Regenerate AGENTS.md Auto-invoke tables (sync.sh) | `skill-sync` |
| Troubleshoot why a skill is missing from AGENTS.md auto-invoke | `skill-sync` |

---

## Project Overview

Prowler is an open-source cloud security assessment tool supporting AWS, Azure, GCP, Kubernetes, GitHub, M365, and more.

| Component | Location | Tech Stack |
|-----------|----------|------------|

---

## Python Development

```bash
# Setup
poetry install --with dev
poetry run pre-commit install

# Code quality
poetry run make lint
poetry run make format
poetry run pre-commit run --all-files
```

---

## Commit & Pull Request Guidelines

Follow conventional-commit style: `<type>[scope]: <description>`

**Types:** `feat`, `fix`, `docs`, `chore`, `perf`, `refactor`, `style`, `test`

Before creating a PR:
1. Complete checklist in `.github/pull_request_template.md`
2. Run all relevant tests and linters
3. Link screenshots for UI changes
