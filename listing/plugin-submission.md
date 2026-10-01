# Plugin bundle submission: Performance Coach by RapportScore

Portal answers for the plugin submission (Submit new, then Plugin
bundle) at [claude.ai/directory/manage](https://claude.ai/directory/manage).
Submit the MCP connector first (`connector-listing.md`); the plugin
references that server and Anthropic pairs the two listings.

## Prerequisites

- [ ] The submitter's GitHub account is connected to claude.ai in the
      Rapport Score LLC Claude organization, with push access to
      `Rapport-Score-LLC/rapportscore-performance-coach`.
- [ ] `claude plugin validate ./plugin` passes locally.
- [ ] The repository is public (required before the listing goes live;
      private is fine during review).

## Source step

- **Repository:** `Rapport-Score-LLC/rapportscore-performance-coach`
- **Plugin path:** `plugin`
- **Branch or tag:** leave empty (follows the default branch, `main`)
- Select **Validate**; fix anything marked Blocking and re-validate.

## Listing details step

Read-only: name and description come from `plugin/.claude-plugin/plugin.json`
and `plugin/README.md`. To change the card, edit those files and push.

## Data handling step

- **Reads or stores personal data:** the plugin itself stores nothing and
  has no code. Coaching references the user's RapportScore data only
  through the declared RapportScore connector, which the user authorizes
  with OAuth.
- **Sends data to services other than its declared connectors:** No. The
  only declared destination is `https://mcp.rapportscore.ai/mcp`.
- **Data retention:** none by the plugin. RapportScore account data is
  governed by the RapportScore privacy policy
  (https://app.rapportscore.ai/privacy.html).
- **Intended for people under 18:** No.

## Compliance step

- Contact email: **TODO** (same monitored address as the connector
  submission).
- Select all four acknowledgments.

## Review and submit step

- **How new versions reach the directory:** GitHub push webhook
  (recommended; requires repo admin to install it when prompted).
- **Auto-publish passing versions:** on, after the first version is
  cleared by a reviewer.

## Release process (after it is live)

1. Update the brain in corner-coach-brain, run `tools/bake.sh`.
2. Bump `version` in `plugin/.claude-plugin/plugin.json`.
3. `claude plugin validate ./plugin`, commit, push to `main`.
4. The directory scans the new commit and publishes per the auto-publish
   setting.
