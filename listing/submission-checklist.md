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

## Phase 1: Server readiness (connector submission gate) - DONE

- [x] **[eng]** Titles and annotations on all 33 tools: verified complete
      in `rapport-pilot-vision` main and deployed (edge function
      `mcp-server` v107, ACTIVE, updated 2026-09-30). Details in
      `tool-annotations.md`.
- [x] **[eng]** OAuth verified live: RFC 9728 metadata, dynamic client
      registration, authorization code + refresh grants all published at
      mcp.rapportscore.ai.
- [ ] **[eng]** Optional belt-and-suspenders: run the tools once via MCP
      Inspector before the portal's Test and launch confirmation (the
      production connector already runs them daily in Claude).

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

## Content rulings

Two uses of the "diagnos" stem in the vendored brain are founder-cleared
(adjudicated 2026-10-03), not violations: the belt-lesson curriculum copy
in `coaching/training-curriculum-map.md` mirrors shipped belt_lessons
product rows, and governance precedence puts shipped product copy above
the banned-token list; `coaching/receipt-to-inner-driver.md` names the
stem only to coach against the behavior. `tools/bake.sh` allowlists both
and flags only NEW uses elsewhere.
