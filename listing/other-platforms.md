# Grok, Gemini, Perplexity: distribution status (2026-10-03)

The same production MCP server (mcp.rapportscore.ai/mcp, OAuth, 33
tools) is the asset on every platform. What differs is whether a public
directory exists and who can connect.

## Grok (xAI)

- **User-level: DONE.** Ron's Grok already shows "Rapportscore.ai"
  connected (grok.com/connectors), and prior Grok chats used it for
  belt-level queries. Any Grok user can do the same: Plugins, New
  Connector, Custom, paste the server URL (Streamable HTTP).
- **Catalog: no public path.** xAI's docs describe built-in connectors
  and a pre-configured catalog but publish no vendor submission form;
  catalog placement is an xAI partnership conversation. Custom
  connectors remain per-user.
- Action: publish a "Use RapportScore in Grok" help article with the
  3-click setup, and run the partner motion below.

### Becoming a Grok catalog partner (the listing path)

There is no submission form. Verified from the launch post
(x.ai/news/grok-connectors) and the community catalog: the third-party
tiles are hosted MCP servers xAI chooses to surface, every one of them
shaped exactly like ours (mcp.box.com, mcp.canva.com/mcp,
mcp.stripe.com... mcp.rapportscore.ai/mcp). RapportScore is technically
catalog-ready today; the gap is a relationship, not engineering.

Three channels, in order of expected effect:

1. **x.ai Contact Sales form** (the only official channel the launch
   post links). Paste-ready text:

   > We make RapportScore (app.rapportscore.ai), conversation
   > intelligence that measures how people communicate in their own
   > recorded calls and coaches them on it. Our production MCP server
   > (https://mcp.rapportscore.ai/mcp, OAuth 2.0 with dynamic client
   > registration, 33 annotated tools) is the same shape as your
   > catalog tiles from Box, Canva, and Stripe, and it already runs in
   > Grok today as a Bring Your Own MCP connector on paying accounts.
   > Our companion plugin was approved and published in Anthropic's
   > Claude directory this week. We would like RapportScore surfaced
   > in the Grok connector catalog; who is the right person to speak
   > with? Ron Skelton, Founder, Rapport Score LLC,
   > ron@rapportscore.ai.

2. **X, in public.** xAI's culture and team live on X. Post a short
   screen recording of Grok coaching from real RapportScore data
   through the connector, tag @xai and @grok, state "already works via
   Bring Your Own MCP, catalog tile when?" Founder-posted demos are
   how small vendors get noticed there. Ron posts this personally.

3. **Community catalog PR.** The awesome-grok-connectors GitHub list
   is where Grok power users find MCP servers; a PR adding
   RapportScore's endpoint gets discoverability while the xAI
   conversation happens. (Ron's call to submit; it is a public post.)

Proof points to lead with everywhere: live in Anthropic's reviewed
Claude directory; identical hosted-MCP shape to existing catalog
vendors; working today in Grok, ChatGPT, and Claude off one server.

## Gemini (Google)

- **No public directory.** Google runs three separate surfaces with no
  vendor submission form anywhere: the consumer Gemini app's agent
  (Spark) reaches tools over MCP but its named connectors are
  negotiated deals; Gemini Enterprise lets each customer connect a
  Streamable HTTP server themselves; the CLI extensions gallery is
  community-ranked and mid-migration (Antigravity).
- **User-level:** a Gemini user with Spark access can add the server as
  a custom connected app inside Spark tasks; Gemini Enterprise
  customers can add it org-wide. Both use the same URL.
- Action: help-article instructions for Spark and Enterprise users; a
  Google partnership is the only route to a named connector.

## Perplexity

- **User-level only, macOS app only (as of mid-2026).** Custom remote
  MCP connectors ship for Pro, Max, and Enterprise through the Mac App
  Store build: profile, All settings, Connectors, + Custom connector,
  name + server URL, transport Streamable HTTP. Windows, Linux, and
  web cannot add MCP servers yet. No vendor directory.
- Action: Ron can add it in his Perplexity Mac app in about two
  minutes; include the steps in the same help article.

## Pattern across all five platforms

| Platform | User connects today? | Public directory? | Status |
|---|---|---|---|
| Claude | yes (connector) | yes | Plugin LIVE; connector submission drafted |
| ChatGPT | yes (already connected) | yes (plugins) | Package built and upload-tested; blocked only on identity verification |
| Grok | yes (already connected) | partnership only | Done at user level |
| Gemini | Spark or Enterprise only | partnership only | Instructions to publish |
| Perplexity | Mac app, paid plans | none | Instructions to publish |

One help page on app.rapportscore.ai ("Use RapportScore in your AI
assistant") covering all five setups is the highest-leverage next
marketing asset: every platform's user-level path is the same URL.
