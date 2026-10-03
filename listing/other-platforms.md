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
  3-click setup; pursue xAI partnership separately if the channel
  earns it.

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
