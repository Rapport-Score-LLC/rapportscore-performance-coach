# rapportscore-performance-coach

Maintainer repository for **Performance Coach by RapportScore**: the free
Claude plugin, plus every material needed for RapportScore's two Anthropic
directory submissions (the MCP connector listing and the plugin listing).

## Repository map

| Path | What it is |
|---|---|
| `plugin/` | The submittable plugin. `plugin/README.md` is the public listing description. Submit with plugin path `plugin`. |
| `plugin/skills/performance-coach/` | The coach skill and the vendored coach brain (`references/brain/`, baked from [corner-coach-brain](https://github.com/Rapport-Score-LLC/corner-coach-brain)). |
| `plugin/.mcp.json` | Declares the RapportScore remote MCP server (`https://mcp.rapportscore.ai/mcp`). |
| `listing/` | Paste-ready portal copy and checklists for both directory submissions. |
| `tools/bake.sh` | Re-syncs the vendored brain from the public brain repo and runs the governance checks. |

## The two submissions

Both happen in the developer portal at
[claude.ai/directory/manage](https://claude.ai/directory/manage), as separate
submissions that Anthropic pairs:

1. **MCP connector** (the RapportScore server): fields and answers in
   `listing/connector-listing.md`, tool annotation requirements in
   `listing/tool-annotations.md`, reviewer walkthrough in
   `listing/reviewer-test-guide.md`.
2. **Plugin bundle** (this repository, path `plugin`): portal answers in
   `listing/plugin-submission.md`.

Work the end-to-end order in `listing/submission-checklist.md`.

## Updating the plugin

1. Edit the brain in the corner-coach-brain repository (never edit
   `references/brain/` by hand; it is generated).
2. Run `tools/bake.sh` to re-vendor and re-check.
3. Bump `version` in `plugin/.claude-plugin/plugin.json`.
4. Validate: `claude plugin validate ./plugin`
5. Commit and push. The directory picks up the tracked branch and re-scans.

## Content rules

All copy in this repository follows the coach brain's governance rules
(see corner-coach-brain `_meta/governance.md`): no em dash, no "AI-powered"
(use "science-based, AI-enhanced"), no "diagnos*" stem, no outcome
guarantees, no competitor names, no invented statistics.

Copyright (c) 2026 Rapport Score LLC.
