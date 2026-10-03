# Tool sweep results (custom connector in Claude, 2026-10-03)

Every read-only tool was invoked live against the production server
(mcp.rapportscore.ai/mcp, edge function v107) through the account
owner's own connector session, per the portal's self-tested attestation
("run every tool via MCP Inspector or as a custom connector in Claude").
Primary test session: f99b8c7d (Ronald Skelton and Daniel Andrews,
26 min, completed).

## Result: 25 of 26 read tools PASS; 1 bug found

| Tool | Result |
|---|---|
| whoami | PASS (belt, plan, pending actions) |
| list_sessions | PASS (filters honored) |
| list_uploads | PASS (allowance + needs) |
| get_progress | PASS (belt history, baselines, next_belt_gate) |
| get_session | PASS |
| get_session_overview | PASS (full debrief bundle) |
| get_session_scores | PASS (overall + 7 dimensions) |
| get_session_measurements | PASS, with a note below |
| get_session_communication | PASS |
| get_session_coverage | PASS (all layers present) |
| get_transcript | PASS (paging works) |
| get_srt_transcript | PASS (135 cues, valid SRT) |
| get_vtt_transcript | PASS (124 coalesced turns, valid WebVTT) |
| list_session_moments | PASS (67 moments, rollups, truncation note) |
| get_moment_evidence | PASS (window + player link) |
| get_next_step (no args) | PASS (graceful no-open-call answer) |
| get_next_step (completed session id) | **FAIL: generic server error** |
| get_training_links | PASS (lessons per blocking dimension) |
| ask_coach | PASS (cited answer, timestamped receipts) |
| get_speaker_labeling_task | PASS (empty needs on completed session) |
| verify_session_setup | PASS (plain-speech readback) |
| get_team_overview | PASS (real team aggregates) |
| get_team_report (real id) | PASS (text + section + TOC) |
| get_team_report (garbage id) | PASS (clean not_found error shape) |
| get_team_session_recap | PASS |
| list_team_counterparts | PASS (empty window handled) |
| list_team_reports | PASS |
| list_team_sessions | PASS |

## Bug for engineering (fix open: rapport-pilot-vision PR #1154)

`get_next_step` with the session_id of a COMPLETED session returns
"Something went wrong handling this request." The no-argument call
handles the same situation gracefully ("There is no open call to
finish..."). Expected: the explicit-id path should return the same
graceful answer for any session that is not open.

## Notes (not bugs)

- `get_session_measurements` silently ignores unrecognized
  `measurement_keys` entries and returns every graduated measurement
  (~127 KB for a 26-minute call). Consider rejecting unknown keys by
  name, matching the enum-refusal style the other tools use.
- The 7 write tools (upload_conversation, start_analysis,
  assign_speaker, attach_session_metadata, capture_session_feedback,
  share_session, connect_calendar) were NOT exercised in this sweep;
  they mutate account data. Run them against the reviewer test account
  while populating it, which completes the 33/33 attestation.
