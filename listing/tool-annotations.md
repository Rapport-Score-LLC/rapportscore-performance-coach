# Tool annotations: VERIFIED COMPLETE (2026-10-03)

The portal requires every tool to carry a `title` and a `readOnlyHint` or
`destructiveHint` annotation. **This is done.** Verified directly in the
source of record (`rapport-pilot-vision` main,
`supabase/functions/mcp-server/`) and against the deployment: edge
function `mcp-server` is ACTIVE at version 107, last updated 2026-09-30,
so the live server serves these annotations today.

**All 33 tools pass: 26 read-only, 7 write, 0 destructive.**
No tool deletes user data; say exactly that in the listing and reviewer
notes.

## Read-only tools (26)

All use the frozen `READ_ONLY_TOOL_ANNOTATIONS` constant:
`readOnlyHint: true, destructiveHint: false, idempotentHint: true,
openWorldHint: false`.

ask_coach (Ask the coach), get_moment_evidence, get_next_step,
get_progress, get_session, get_session_communication,
get_session_coverage, get_session_measurements, get_session_overview,
get_session_scores, get_speaker_labeling_task, get_srt_transcript,
get_team_overview, get_team_report, get_team_session_recap,
get_training_links, get_transcript, get_vtt_transcript,
list_session_moments, list_sessions, list_team_counterparts,
list_team_reports, list_team_sessions, list_uploads,
verify_session_setup, whoami (Who am I).

## Write tools (7)

Each carries an explicit inline object with all four hints,
`destructiveHint: false` throughout:

| Tool | Title | Notes |
|---|---|---|
| upload_conversation | Upload conversation | |
| start_analysis | Start analysis | |
| assign_speaker | Assign speaker | idempotent |
| attach_session_metadata | Attach session metadata | idempotent |
| capture_session_feedback | Capture session feedback | idempotent |
| share_session | Share a call with someone who was on it | `openWorldHint: true`, deliberate: it sends one email that leaves the platform, documented in a source comment |
| connect_calendar | Connect calendar | `openWorldHint: false`, deliberate: it returns a connect link and instructions; it does not reach out itself |

## What this means for the submission

Nothing to build. On the portal's Tools step, the synced tool list
should show every tool grouped correctly with no flags. If anything is
flagged there, the deployed function has drifted from main: redeploy
`mcp-server` and refresh the step.
