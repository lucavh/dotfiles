#!/bin/sh
# Prints the Authorization header for the GitHub MCP server, using the gh CLI login.
# Used by Claude Code's headersHelper so the token is never stored in config.
# X-MCP-Toolsets limits the server to the tool groups actually used.
printf '{"Authorization": "Bearer %s", "X-MCP-Toolsets": "context,repos,issues,pull_requests"}\n' "$(gh auth token)"
