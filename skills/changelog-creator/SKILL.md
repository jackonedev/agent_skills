---
name: changelog-creator
description: >
  Creates and updates CHANGELOG.md files with consistent structure and entries.
  Trigger: When adding a changelog entry for a PR/feature, updating any CHANGELOG.md,
  or creating a release section.
license: Apache-2.0
metadata:
  author: current_repo
  version: "1.0.0"
  scope: [root]
  auto_invoke:
    - "Add a changelog entry for a PR or feature"
    - "Update CHANGELOG.md"
    - "Create a new release section in CHANGELOG.md"
    - "Review changelog format and conventions"
allowed-tools: Read, Edit, Write, Glob, Grep, Bash
---

# Changelog Creator

Maintains `CHANGELOG.md` files using a consistent, review-friendly format.

## When to Use

- A PR needs a changelog entry
- A repo/component has multiple changelogs and you must update the right one(s)
- You’re cutting a release and need to move entries from “Unreleased” to a versioned section
- You need to standardize an existing changelog’s structure without rewriting history

## Critical Patterns

### 1) Prefer an “Unreleased” section

If the changelog supports it, keep a top section for unreleased changes. Released sections should be treated as immutable.

**Rule**: Don’t edit already released version blocks unless the repo’s policy explicitly allows it.

### 2) Stable category order

Use a consistent category order and keep it stable across versions:

```markdown
### 🚀 Added
### 🔄 Changed
### ⚠️ Deprecated
### ❌ Removed
### 🐞 Fixed
### 🔐 Security
```

If the repo doesn’t use emojis, keep the same category names without them.

### 3) Entry placement and style

- Add new entries at the **bottom** of the correct category block (oldest → newest)
- Describe **what changed**, not why
- Keep one bullet per PR/changeset when possible
- Avoid trailing periods

If the repo uses PR links, use the canonical link format for that repo.

### 4) Releases

When releasing:
- Create a new version header (or convert “Unreleased” to a version)
- Move entries into the new version section
- Ensure the new “Unreleased” section exists and is empty (or present with empty categories)

### 5) Multi-component repos

If there are multiple changelogs:
- Update the changelog(s) that correspond to the changed component(s)
- If unsure, inspect changed paths (`git diff --name-only`) to decide

## Templates

- Entry templates and examples: [assets/entry-templates.md](assets/entry-templates.md)

## Commands

```bash
# See changed files (to decide which component changelog(s) to update)
git diff --name-only

# Find all changelogs
find . -name CHANGELOG.md -not -path '*/node_modules/*' -not -path '*/.git/*'
```
