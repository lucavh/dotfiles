#!/usr/bin/env zsh
# Registers Claude Code MCP servers (user scope). Safe to re-run: existing
# servers are skipped. Requires: claude, gh (logged in), node/npx.

set -u
DOTFILES_DIR="${0:A:h}"
FS_SERVER="@modelcontextprotocol/server-filesystem@2.0.1"  # pinned on purpose

has() { claude mcp get "$1" >/dev/null 2>&1; }

add() {
  local name="$1"; shift
  if has "$name"; then
    echo "• $name already configured, skipping"
  else
    echo "+ adding $name"
    claude mcp add --scope user "$name" "$@"
  fi
}

# GitHub header helper: token comes from `gh auth token` at connect time.
mkdir -p ~/.claude
ln -sfn "$DOTFILES_DIR/claude/mcp-headers-github.sh" ~/.claude/mcp-headers-github.sh

add context7 --transport http https://mcp.context7.com/mcp
add oreilly  --transport http https://api.oreilly.com/api/search/v1/mcp

if has github; then
  echo "• github already configured, skipping"
else
  echo "+ adding github"
  claude mcp add-json --scope user github \
    "{\"type\":\"http\",\"url\":\"https://api.githubcopilot.com/mcp/\",\"headersHelper\":\"$HOME/.claude/mcp-headers-github.sh\"}"
fi

# Obsidian: only vaults that exist on this machine.
vaults=()
for v in "$HOME/Obsidian/lucavh" "$HOME/Obsidian/knowledge-base"; do
  [[ -d "$v" ]] && vaults+=("$v")
done
if (( ${#vaults} )); then
  add obsidian -- npx -y "$FS_SERVER" "${vaults[@]}"
else
  echo "• no Obsidian vaults found, skipping obsidian"
fi

# Home Assistant: long-lived token, read without echo, never printed.
if has home-assistant; then
  echo "• home-assistant already configured, skipping"
else
  read -rs "HA_TOKEN?Home Assistant long-lived token (empty to skip): "; echo
  if [[ -n "$HA_TOKEN" ]]; then
    echo "+ adding home-assistant"
    claude mcp add --scope user --transport http home-assistant \
      https://home.3551.nl/api/mcp --header "Authorization: Bearer $HA_TOKEN"
  else
    echo "• skipped home-assistant"
  fi
  unset HA_TOKEN
fi

echo
echo "Next: run /mcp in Claude Code and sign in to oreilly."
echo "Google Drive/Gmail/Calendar come from claude.ai Settings > Connectors."
