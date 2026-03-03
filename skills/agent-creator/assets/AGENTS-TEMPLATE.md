# Repository Guidelines

## How to Use This Guide

- Start here for cross-repo norms.
- If this repo is a monorepo, each component folder can have its own `AGENTS.md`.
- Component guides override this guide when guidance conflicts.

## Available Skills

Use these skills for detailed patterns on-demand.

### Generic Skills (Any Project)
| Skill | Description | URL |
|-------|-------------|-----|
| Fixing bugs, implementing features, refactoring, or investigating existing code flows | `codenavi` | [SKILL.md](skills/codenavi/SKILL.md) |
| Writing, modifying, or reviewing code implementations | `coding-guidelines` | [SKILL.md](skills/coding-guidelines/SKILL.md) |
| Writing, reviewing, or editing documentation | `docs-writter` | [SKILL.md](skills/docs-writter/SKILL.md) |

### current_project-Specific Skills
| Skill | Description | URL |
|-------|-------------|-----|
| `agent-creator` | Create/update `AGENTS.md` files | [SKILL.md](skills/agent-creator/SKILL.md) |
| `skill-creator` | Create new AI agent skills | [SKILL.md](skills/skill-creator/SKILL.md) |
| `skill-sync` | Sync skill metadata into Auto-invoke tables | [SKILL.md](skills/skill-sync/SKILL.md) |

### Auto-invoke Skills

When performing these actions, ALWAYS invoke the corresponding skill FIRST:

| Action | Skill |
|--------|-------|
| Creating AGENTS.md files | `agent-creator` |
| Creating new skills | `skill-creator` |
| After creating/modifying a skill | `skill-sync` |

---

## Project Overview

{One paragraph about what this repo is and who uses it.}

| Component | Location | Tech Stack |
|-----------|----------|------------|
| {component-name} | {path} | {stack} |

---

## Development

```bash
# Setup
{setup commands}

# Lint/format/test
{quality commands}
```

---

## Commit & Pull Request Guidelines

{Optional. If your repo has standards, put them here.}
