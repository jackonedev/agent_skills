# Changelog Entry Templates

## Entry Placement Rule

**CRITICAL:** Add new entries at the **BOTTOM** of each category section (before the next section header or a version separator).

This preserves chronological order: oldest entries at top, newest at bottom.

## Category Headers (Preferred)

```markdown
### 🚀 Added
### 🔄 Changed
### ⚠️ Deprecated
### ❌ Removed
### 🐞 Fixed
### 🔐 Security
```

If the repo does not use emojis, use the same category names without emojis.

## Entry Patterns

> Category headers already carry the “verb”. Entries should describe **what** changed.

### 🚀 Added
```markdown
- {new capability} ({link-to-pr-or-issue})
- {new CLI flag} to {do something} ({link})
```

### 🔄 Changed
```markdown
- {behavior} now {new behavior} ({link})
- {dependency} from {old} to {new} ({link})
```

### 🐞 Fixed
```markdown
- {bug description} in {component} ({link})
```

### 🔐 Security
```markdown
- {package} to {version} (CVE-XXXX-XXXXX) ({link})
```

### ❌ Removed
```markdown
- {removed feature} from {location} ({link})
```

### ⚠️ Deprecated
```markdown
- {feature} in {location} ({link})
```

## Version Header Templates

### Unreleased (recommended)
```markdown
## [Unreleased]
```

### Released version
```markdown
## [X.Y.Z] - YYYY-MM-DD

---
```

## Full Example (with Unreleased)

```markdown
## [Unreleased]

### 🚀 Added

- {your new entry goes here} ({link})

### 🐞 Fixed

- {your fix goes here} ({link})

---

## [1.2.3] - 2026-03-03

### 🚀 Added

- Example older entry ({link})

### 🐞 Fixed

- Example older fix ({link})
```
