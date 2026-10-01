# Reviewer test guide (for the portal's Test and launch step)

Paste the walkthrough below into the Test and launch step, after filling
the placeholders. Reviewers need to connect, authorize, and run tools
without guessing; write every step as if they have never seen the
product.

## Prepare the reviewer account first (internal checklist)

- [ ] Create a dedicated account (for example reviewer@rapportscore.ai),
      never a real customer's. Only reviewers see the credentials.
- [ ] Give it an active plan with analysis hours.
- [ ] Populate it fully: at least 3 analyzed sessions with scores across
      the 7 dimensions, transcripts, moments, labeled speakers, and
      visible progress, plus 1 upload left in a pending state so
      list_uploads and the labeling tools have real work to show.
- [ ] If team tools should be reviewable, make it a coach of a small demo
      team with at least one Team Intelligence Report.
- [ ] Log in once yourself and run the walkthrough end to end.

## Walkthrough text for the portal (fill placeholders, then paste)

> **Account:** [EMAIL] / [PASSWORD] at https://app.rapportscore.ai
> This is a dedicated review account populated with demo conversation
> data. No real customer data is visible.
>
> **Connect:** add the connector and complete OAuth in the browser with
> the credentials above. Approve the requested scopes.
>
> **Suggested test sequence:**
> 1. `whoami`: returns the review account's profile.
> 2. `list_sessions`: returns the demo sessions.
> 3. `get_session_overview` with the first session id: scores and
>    summary for that conversation.
> 4. `get_session_scores`, then `get_session_measurements`: the 7
>    dimensions, then the deterministic measurements behind them.
> 5. `get_transcript`: the conversation text with speakers.
> 6. `list_session_moments`, then `get_moment_evidence` on one moment:
>    the receipt system, every claim traced to the tape.
> 7. `ask_coach` with "why did my trust building score drop": a coaching
>    answer citing the demo sessions.
> 8. `get_progress` and `get_next_step`: belt status and next action.
> 9. `list_uploads`: shows one pending upload;
>    `get_speaker_labeling_task` shows the labeling work for it.
> 10. Team tools (`get_team_overview`, `list_team_reports`,
>     `get_team_report`): the demo team the account coaches.
>
> **Write tools:** `upload_conversation`, `start_analysis`,
> `assign_speaker`, `attach_session_metadata`,
> `capture_session_feedback` create or label data inside this review
> account only. `share_session` creates a share link; `connect_calendar`
> starts a calendar authorization. No tool deletes anything.
>
> **Expected behavior notes:** a measurement missing from a session means
> it did not run on that session, not an error. Analysis of a new upload
> can take several minutes.
