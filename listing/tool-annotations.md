# Tool annotation requirements (all 33 tools)

The portal flags any tool missing a `title` and a `readOnlyHint` or
`destructiveHint`. These annotations live in the server's tool
definitions (MCP `annotations` object per tool), so this is a server-side
change. Suggested titles below are customer-facing: short, plain, no
jargon.

**Summary: 26 read-only tools, 7 write tools, 0 destructive tools.**
No tool deletes or overwrites user data; say exactly that in the listing
and the reviewer guide, because reviewers look for it.

## Read-only tools (annotate `readOnlyHint: true`)

| Tool | Suggested title |
|---|---|
| whoami | Get my profile |
| list_sessions | List my sessions |
| get_session | Get session details |
| get_session_overview | Get session overview |
| get_session_scores | Get session rapport scores |
| get_session_measurements | Get session measurements |
| get_session_communication | Get session communication profile |
| get_session_coverage | Get measurement coverage |
| get_transcript | Get transcript |
| get_srt_transcript | Get transcript (SRT) |
| get_vtt_transcript | Get transcript (VTT) |
| list_session_moments | List session moments |
| get_moment_evidence | Get moment evidence |
| get_progress | Get coaching progress |
| get_next_step | Get next coaching step |
| get_training_links | Get training links |
| ask_coach | Ask the coach |
| get_speaker_labeling_task | Get speaker labeling task |
| verify_session_setup | Verify session setup |
| list_uploads | List uploads and pending actions |
| get_team_overview | Get team overview |
| get_team_report | Get team report |
| get_team_session_recap | Get team session recap |
| list_team_counterparts | List team counterparts |
| list_team_reports | List team reports |
| list_team_sessions | List team sessions |

## Write tools (annotate `readOnlyHint: false`, `destructiveHint: false`)

| Tool | Suggested title | Extra annotation |
|---|---|---|
| upload_conversation | Upload a conversation recording | |
| start_analysis | Start session analysis | |
| assign_speaker | Assign speaker identity | |
| attach_session_metadata | Attach session metadata | |
| capture_session_feedback | Capture session feedback | |
| share_session | Share a session | `openWorldHint: true` (creates access beyond the user's own account) |
| connect_calendar | Connect a calendar | `openWorldHint: true` (reaches an external service) |

## Description quality bar

Reviewers read tool names and descriptions as the user does. For each
tool, the description should state what it returns or changes, in one or
two sentences, without internal vocabulary. The existing server
descriptions are strong; audit each against three questions:

1. Would a user understand what happens from the description alone?
2. Does a write tool say exactly what it creates or changes?
3. Does nothing in the description promise outcomes or use banned terms
   (the "diagnos*" stem, "AI-powered", guarantees, competitor names)?

## Verification before submitting

Run the server through MCP Inspector and confirm every tool shows its
title and hints, then connect it to Claude as a custom connector and call
each tool once. The portal's Test and launch step asks you to confirm
this was done.
