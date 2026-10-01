# End-to-end submission checklist

Work top to bottom. Founder/owner actions are marked **[owner]**;
engineering actions **[eng]**. Everything else is already prepared in
this repository.

## Phase 0: Assets and accounts (blockers for both submissions)

- [ ] **[owner]** Icon: square PNG of the RapportScore mark, transparent
      background, at least 512x512. Needed for the connector listing.
- [ ] **[owner]** Monitored contact email for review updates (and ideally
      a public support email).
- [ ] **[owner]** Claude account on a paid plan, in the organization that
      will own the listings, with access to
      [claude.ai/directory/manage](https://claude.ai/directory/manage).
- [ ] **[owner]** GitHub account connected to claude.ai in that
      organization, with push access to this repository.
- [ ] **[owner]** Reviewer test account created and populated per
      `reviewer-test-guide.md`.

## Phase 1: Server readiness (connector submission gate)

- [ ] **[eng]** Add `title` plus `readOnlyHint`/`destructiveHint` to all
      33 tools per `tool-annotations.md` (plus the two `openWorldHint`
      flags).
- [ ] **[eng]** Run every tool once via MCP Inspector or as a custom
      connector in Claude; fix anything broken.
- [ ] **[eng]** Confirm OAuth works from a fresh Claude connection
      (dynamic client registration, authorize, refresh).

## Phase 2: Submit the MCP connector

- [ ] Portal: Submit new, MCP connector, then paste from
      `connector-listing.md` step by step.
- [ ] Watch for flagged tools on the Tools step; fix server-side and
      refresh.
- [ ] Submit, then track status in the portal.

## Phase 3: Submit the plugin

- [ ] `claude plugin validate ./plugin` passes.
- [ ] Repository public on GitHub.
- [ ] Portal: Submit new, Plugin bundle, then follow
      `plugin-submission.md`.
- [ ] Install the GitHub push webhook when offered.

## Phase 4: After both are live

- [ ] Pair the plugin with the connector listing if the portal has not
      already (the connector listing gives the org the server dashboard).
- [ ] Apply for Verified status on the connector.
- [ ] Add "Available for Claude" with the listing links to
      app.rapportscore.ai and the help page.
- [ ] Watch the connector health dashboard and the plugin Usage tab for
      the first week.

## Known content issues (do not block submission; fix in the brain repo)

Two notes in the vendored brain use the banned "diagnos*" stem:

1. `coaching/training-curriculum-map.md` line 82 ("Diagnose any
   conversation" as lesson BK1's outcome). The lesson name may be bound
   to a belt_lessons product row; rename in the product first, then the
   note.
2. `coaching/receipt-to-inner-driver.md` line 34 ("multiple-choice
   diagnosis").

`tools/bake.sh` reports both as known issues on every run until fixed
upstream in corner-coach-brain.
