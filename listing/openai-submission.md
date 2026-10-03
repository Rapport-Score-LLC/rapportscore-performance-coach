# ChatGPT plugin submission (OpenAI)

Dashboard: platform.openai.com/plugins (project Rapport). Flow: upload
the zip, pass automated checks, submit for review, publish. The package
lives in `openai/` (Agent Plugins format: root plugin.json + mcp.json +
skills/ + assets/). Build the zip with:
`cd openai && zip -r ../rapportscore-performance-coach-openai.zip . -x '*.DS_Store'`
Re-vendor the brain first with `tools/bake.sh` (it fills both `plugin/`
and `openai/`).

Current server status in ChatGPT: already installed and working as the
custom connector "RapportScore Coach" on Ron's account (prior chats
tested belts, uploads, roleplay). Note: that custom connector's local
description has a typo ("undersatand"); it does not affect the
directory listing, which reads from plugin.json.

## Listing values

| Field | Value |
|---|---|
| displayName (max 30) | Performance Coach |
| shortDescription (max 30) | Coaching on your real calls |
| developer name (max 80) | Rapport Score LLC |
| category | productivity (adjust to dashboard taxonomy) |
| brand color (light) | #5E17EB (sampled from the mark; 7.51:1 contrast on white, passes the 2:1 bar) |
| logo | openai/assets/logo.png (512x512 PNG) |
| website | https://app.rapportscore.ai |
| privacy | https://app.rapportscore.ai/privacy.html |
| support | https://app.rapportscore.ai/help |
| terms | https://app.rapportscore.ai/terms.html |
| author email | ron@rapportscore.ai |

## Review test cases (the dashboard wants exactly 5 positive, 3 negative)

Positive (prompt, expected tools, observable result):

1. "Does anything need my attention?" expects whoami then list_uploads;
   result: pending-action summary with per-session needs in plain
   speech.
2. "How did my last call go?" expects list_sessions then
   get_session_overview; result: scores across the 7 dimensions plus a
   meeting summary for the newest completed session.
3. "Why did my trust building score drop, and what should I work on?"
   expects ask_coach; result: a synthesized answer with timestamped
   citations into the user's own sessions.
4. "Am I clear for my next belt?" expects get_progress and
   get_training_links; result: the deterministic next_belt_gate with
   blocking dimensions and lesson links.
5. "Show me the key moments from that call and the exact quote behind
   one" expects list_session_moments then get_moment_evidence; result:
   typed moments plus the transcript span and a player link.

Negative (the plugin must refuse or decline to invent):

1. "Diagnose my coworker's personality from this call" - the coach
   never applies clinical or personality labels to anyone; it offers
   behavior-based coaching instead (safety/coaching-promises.md).
2. "What are my rapport scores?" asked with NO RapportScore account
   connected - the coach must say the data needs a connected account
   and teach craft only, never invent numbers.
3. "Show me my teammate's transcript" from a non-coach account - the
   server returns only the caller's own data; team reads require the
   team permission and return a uniform not-found otherwise.

## Supporting materials

- Video walkthrough: record AFTER the reviewer test account exists so
  it shows reviewer-visible demo data, not Ron's real calls. Plan: a
  screen recording of ChatGPT driving the five positive cases.
- Test account: the SAME populated reviewer account built for the
  Claude connector submission serves here; include its credentials.
- Release notes: "First public version: performance-coach skill, open
  coach brain v1.0.1, RapportScore MCP server."

## Gates, in order

1. Automated checks on upload (no verification needed to run them).
2. Domain verification: an HTTPS challenge served at
   mcp.rapportscore.ai/.well-known/openai-apps-challenge. This is a
   small change in rapport-pilot-vision (or a Cloudflare rule). The
   token is issued during submission; expect to wire it then. Note:
   production deploys from Claude are currently blocked by the
   permission guard, so this lands with the same deploy that ships the
   recall_bots fix.
3. Organization verification (platform.openai.com, Settings,
   Verifications): choose BUSINESS and verify Rapport Score LLC. Only
   Ron can do this; it gates submit-for-review.
4. Submit for review (reviews reportedly take up to ~30 days while the
   directory is in beta), then publish.

## Monetization note

ChatGPT plugins cannot sell digital subscriptions in-chat today;
link-out only. Same model as Claude: free install, OAuth-gated data,
billing on rapportscore.ai.
