# Agent Creation (AGENTS.md Authoring)

This `AGENTS.md` is for the `agent_skills/` component. Its job is to help agents create and maintain:

- A **root** `AGENTS.md` (repo-wide rules)
- **Subfolder/component** `AGENTS.md` files (local overrides)

Use the `agent-creator` skill whenever you need an `AGENTS.md` template or need to refresh an existing guide.

## How to Use This Guide

- If you’re creating or updating an `AGENTS.md`, invoke `agent-creator` and start from its template.
- If you’re creating a new skill under `skills/`, invoke `skill-creator`.
- After creating/modifying any skill, invoke `skill-sync` to regenerate Auto-invoke tables.

## Available Skills

> **Skills Reference**: For detailed patterns, use these skills:
> - [`agent-creator`](../skills/agent-creator/SKILL.md) - Root and components AGENTS.md creation/update

### Generic Skills (Any Project)

| Skill | Description | URL |
|-------|-------------|-----|
| Fixing bugs, implementing features, refactoring, or investigating existing code flows | `codenavi` | [SKILL.md](../skills/codenavi/SKILL.md) |
| Writing, modifying, or reviewing code implementations | `coding-guidelines` | [SKILL.md](../skills/coding-guidelines/SKILL.md) |
| Writing, reviewing, or editing documentation | `docs-writter` | [SKILL.md](../skills/docs-writter/SKILL.md) |

### Agent & Skill Authoring

| Skill | Description | URL |
|-------|-------------|-----|
| `agent-creator` | Create/update `AGENTS.md` files (root + subfolders) | [SKILL.md](../skills/agent-creator/SKILL.md) |
| `changelog-creator` | Create/update `CHANGELOG.md` files | [SKILL.md](../skills/changelog-creator/SKILL.md) |
| `skill-creator` | Create new AI agent skills | [SKILL.md](../skills/skill-creator/SKILL.md) |
| `skill-sync` | Sync skill metadata into Auto-invoke tables | [SKILL.md](../skills/skill-sync/SKILL.md) |

### Auto-invoke Skills

When performing these actions, ALWAYS invoke the corresponding skill FIRST:

| Action | Skill |
|--------|-------|
| Add a changelog entry for a PR or feature | `changelog-creator` |
| After creating/modifying a skill | `skill-sync` |
| Create a new release section in CHANGELOG.md | `changelog-creator` |
| Creating AGENTS.md files | `agent-creator` |
| Creating new skills | `skill-creator` |
| Fixing bugs, implementing features, refactoring, or investigating existing code flows | `codenavi` |
| Regenerate AGENTS.md Auto-invoke tables (sync.sh) | `skill-sync` |
| Review changelog format and conventions | `changelog-creator` |
| Troubleshoot why a skill is missing from AGENTS.md auto-invoke | `skill-sync` |
| Update CHANGELOG.md | `changelog-creator` |
| Writing, modifying, or reviewing code implementations | `coding-guidelines` |
| Writing, reviewing, or editing documentation | `docs-writter` |

---

## Quick Start

```bash
# Create or refresh AGENTS.md Auto-invoke sections
./skills/skill-sync/assets/sync.sh
```

## Templates

- Root/component templates: [skills/agent-creator/assets/AGENTS-TEMPLATE.md](../skills/agent-creator/assets/AGENTS-TEMPLATE.md)
