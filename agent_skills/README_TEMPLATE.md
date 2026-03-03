# {Repository Name}

> This is a **README template**.
>
> It is designed so the `agent-creator` skill can reliably extract the information needed to generate a high-quality **root** `AGENTS.md`.
>
> Fill in the placeholders and keep the section headings stable.

---

## 1) Project Overview (Required)

{One paragraph: what this repo is, who uses it, and the primary goal/outcome.}

### Key Capabilities

- {capability}
- {capability}
- {capability}

---

## 2) Repository Structure (Required)

{Explain whether this is a monorepo, and where components live.}

| Component | Location | Tech Stack | Notes |
|-----------|----------|------------|-------|
| {component-name} | {path} | {stack} | {what it does / ownership} |

---

## 3) Getting Started (Required)

### Prerequisites

- {runtime/tooling: e.g. Python 3.12, Node 20, Docker}
- {package manager: e.g. poetry, pnpm}

### Setup

```bash
# Install dependencies
{install command}

# Optional: configure AI assistants / skills
./skills/setup.sh --all
```

### Run

```bash
{run command}
```

---

## 4) Development Workflow (Required)

```bash
# Lint
{lint command}

# Format
{format command}

# Test
{test command}
```

### Common Tasks

- {task}: `{command}`
- {task}: `{command}`

---

## 5) AGENTS & Skills (Required)

This repo uses an Agent Skills layout under `skills/`.

### Where agent guides live

- Root guide: `AGENTS.md`
- Component guides: `{component}/AGENTS.md`

### Keep Auto-invoke tables in sync

After creating/modifying any skill (or changing its `metadata.scope` / `metadata.auto_invoke`):

```bash
./skills/skill-sync/assets/sync.sh
```

---

## 6) Contributing / PR Guidelines (Required)

### Commit Convention

{Describe commit format expectations (or say “no convention”).}

### Pull Requests

- {PR checklist item}
- {PR checklist item}

---

## 7) Release / Versioning (Optional)

{Describe how releases are made, tags, changelog policy, etc.}

---

## 8) Security (Optional)

{How to report vulnerabilities.}

---

## 9) License (Required)

{License name and link.}

---

# For `agent-creator`: Source of Truth

The `agent-creator` skill uses these README sections to populate a root `AGENTS.md`:

- **Project Overview** → `## Project Overview` paragraph and “Key Capabilities”
- **Repository Structure** → components table
- **Development Workflow** + **Getting Started** → commands to run, lint, format, test
- **Contributing / PR Guidelines** → commit/PR conventions
- **AGENTS & Skills** → which scripts exist and how to keep Auto-invoke tables synced

If you change headings substantially, update the root `AGENTS.md` accordingly.
