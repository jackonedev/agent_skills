Agent Skills (vendored component)

What this repo is
- This repository is meant to be copied (vendored) into other repos as a reusable “agent skills” component.
- The two important folders it installs into a target repo are:
  - skills/        (the skills library, each skill has skills/<name>/SKILL.md)
  - agent_skills/  (the component docs and guides, including agent_skills/AGENTS.md)

The minimal workflow (for a TARGET repository)

1) Download and run the installer (no git clone)
- In the root of your target repository, fetch and run the root installer from this repo:

  curl -fsSL https://raw.githubusercontent.com/jackonedev/agent_skills/master/install.sh | bash

- What it does:
  - Downloads a zip archive of this repo (tag or branch)
  - Copies skills/ and agent_skills/ into your target repo
  - Backs up any existing skills/ or agent_skills/ directories (unless you use --overwrite)

2) Configure your AI assistant(s)
- From your target repo root:

  ./skills/setup.sh

- Or non-interactive:
  ./skills/setup.sh --copilot
  ./skills/setup.sh --all

This creates symlinks/copies for assistants (Copilot, Codex, Claude, Gemini) so they can read the skills and agent guides.

3) Create the target repo’s root AGENTS.md
- Open agent_skills/AGENTS.md in your target repo.
- Follow that guide to author your target repo’s root AGENTS.md (repo-wide rules).
  - It is intentionally a “meta guide” that points you to the right skills.
  - Use the agent-creator skill to generate AGENTS.md files consistently.

4) Keep Auto-invoke tables in sync (IMPORTANT)
- After creating/modifying any skill (or changing skill metadata like metadata.scope / metadata.auto_invoke), run:

  ./skills/skill-sync/assets/sync.sh

- This regenerates the "### Auto-invoke Skills" table(s) in AGENTS.md files based on skill metadata.

5) Creating/updating additional guides and docs
- Component or subfolder guides:
  - Create <component>/AGENTS.md for component-specific overrides.
- Root README template:
  - Use agent_skills/README_TEMPLATE.md as a starting point for a target repo’s README (so agent-creator can reliably extract “source of truth” data).

Updating in a target repo
- Re-run the installer with a pinned version (recommended):

  curl -fsSL https://raw.githubusercontent.com/jackonedev/agent_skills/master/install.sh | bash -s -- --ref vX.Y.Z

- Then re-run:
  ./skills/skill-sync/assets/sync.sh

Notes
- You generally should not hand-edit the "### Auto-invoke Skills" section: it is generated.
- Skills live in skills/*/SKILL.md and are the source of truth for auto-invoke metadata.
