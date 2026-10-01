# MCP Connector listing: RapportScore

Paste-ready answers for every step of the developer portal at
[claude.ai/directory/manage](https://claude.ai/directory/manage)
(Submit new, then MCP connector). Field limits are from Anthropic's
submission docs. Items marked **TODO** need a founder decision or an
asset before submitting.

---

## Step 1: Connection

- **Server URL:** `https://mcp.rapportscore.ai/mcp`
- Single URL for all users (do not select "Users connect to different URLs").

## Step 2: Tools

Tools, prompts, and resources sync automatically from the live server.
**Gate:** every tool must carry a `title` and a `readOnlyHint` or
`destructiveHint` annotation or the portal flags it. The required
annotation set for all 33 tools is in `tool-annotations.md`. Fix on the
server first; the portal reads the live server.

## Step 3: Listing

**Server name** (100 chars max):

> RapportScore

**One-liner** (200 chars max, 182 used):

> Measure how you communicate in your own recorded conversations: rapport scores, the 7 Rapport Dimensions, belt progression, transcripts, team reports, and coaching with receipts.

**Description** (2,000 chars max, ~1,450 used):

> RapportScore measures how a person communicates in their own recorded
> conversations, and coaches them on it. Better conversations, measured:
> science-based, AI-enhanced.
>
> Connect your RapportScore account and Claude can work with your real
> conversation data:
>
> **Sessions and scores.** List your analyzed conversations, pull rapport
> scores across the 7 Rapport Dimensions (Active Listening, Curiosity,
> Emotional Acknowledgment, Engagement, Mirroring, Responsiveness, Trust
> Building), and read the deterministic measurements behind each score:
> talk time and turns, question structure, interruptions, response
> latency, backchannels, silence mechanics, and more.
>
> **Transcripts and moments.** Fetch full transcripts (plain, SRT, or
> VTT), list the key moments in a session, and pull the exact evidence
> behind any moment.
>
> **Coaching.** Ask the coach about your numbers or your craft and get
> answers with receipts: every citation points at real data from your own
> sessions. Track belt progression, get your next step, and capture
> feedback.
>
> **Teams.** Coaches and team leads can read team overviews, session
> recaps, and Team Intelligence Reports for the teams they coach.
>
> **Uploads.** Upload a conversation recording, start analysis, label
> speakers, and attach context, all from the conversation with Claude.
>
> RapportScore measures behavior, not truth: results describe how a
> conversation went, never honesty, intent, or who someone is. A
> RapportScore account is required; analysis hours depend on plan.

**Categories** (choose 1 to 5): recommend **Productivity**, **Sales**,
plus the closest matches to professional development and analytics in the
portal's live taxonomy.

**Documentation URL:** `https://app.rapportscore.ai/help`
(alternative: the public brain repo,
`https://github.com/Rapport-Score-LLC/corner-coach-brain`)

**Privacy policy URL:** `https://app.rapportscore.ai/privacy.html`

**Support contact:** `https://app.rapportscore.ai/help`
**TODO:** a monitored support email (for example support@rapportscore.ai)
reads as more professional on the card; add one if available.

**Icon:** **TODO.** Square PNG of the RapportScore mark, transparent
background, at least 512x512, legible at 32x32. Use the existing brand
mark; do not generate a new one.

**URL slug** (permanent once published): `rapportscore`

## Step 4: Use cases

**Primary use cases:**

> Debrief a recorded call with receipts from the actual transcript; track
> rapport scores and belt progression over time; ask the coach why a
> score moved and what to practice next; prepare for an important
> conversation using personal baselines; upload and analyze new
> conversations; read team reports (for coaches).

**What users need before connecting:**

> A RapportScore account (app.rapportscore.ai). Analyzed sessions require
> a plan with analysis hours (Starter, Pro, or Team). A new user can
> connect, upload a first conversation, and analyze it from Claude.

**Reads data, writes data, or both:** Both. Reads sessions, scores,
transcripts, and reports; writes uploads, speaker labels, session
metadata, and feedback. Nothing destructive: no tool deletes data.

## Step 5: Company

- **Company name:** Rapport Score LLC
- **Website:** `https://app.rapportscore.ai`
- **Primary contact:** **TODO** (founder email for review updates)

## Step 6: Authentication

Select **OAuth with dynamic client registration**.

Supporting detail for the form:

> OAuth 2.0 authorization code flow with refresh tokens. The server
> publishes RFC 9728 protected-resource metadata at
> `/.well-known/oauth-protected-resource/mcp` and authorization-server
> metadata at `/.well-known/oauth-authorization-server`, including a
> dynamic client registration endpoint (`/register`). Scopes:
> profile:read, sessions:read, sessions:write, analysis:read,
> coaching:invoke, coaching:read, team:read, calendar:connect,
> reports:read, offline_access.

## Step 7: Data handling

- **API ownership:** our own first-party API (not proxied, not third party).
- **Personal health data:** No.
- **Sponsored content:** No.

## Step 8: Test and launch

Enter credentials for a dedicated reviewer account (never a real
customer's). Build it per `reviewer-test-guide.md`, which is written to be
pasted into this step. Confirm every tool has been run via MCP Inspector
or as a custom connector in Claude before submitting.

## Step 9: Compliance

Seven acknowledgments, all required: directory guidelines, first-party API
usage, financial transactions, AI media generation, prompt injection,
conversation data collection, public documentation. Review each against
current practice before checking; the prompt-injection one expects tool
results to be treated as data, which matches the server's design.

## After submitting

Automatic scan lists the server as a Community connector by default; some
submissions get human review. Track status in the portal. Escalations:
mcp-review@anthropic.com. Later: apply for Verified status once live.
