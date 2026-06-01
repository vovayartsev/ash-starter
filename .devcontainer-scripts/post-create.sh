#!/usr/bin/env bash
set -euo pipefail

echo "[post-create] installing uv …"
curl -LsSf https://astral.sh/uv/install.sh | sh
export PATH="$HOME/.local/bin:$PATH"

echo "[post-create] installing serena (stdio MCP server) …"
uv tool install --from git+https://github.com/oraios/serena serena-agent || \
    echo "[post-create] serena install failed (continuing)"

echo "[post-create] installing mcp-supervisord (editable) …"
uv tool install --editable /workspaces/flylixir/mcp-supervisord

echo "[post-create] mix deps …"
cd /workspaces/flylixir
if [ -f mix.exs ]; then
    mix local.hex --force
    mix local.rebar --force
    mix archive.install hex igniter_new --force
    mix archive.install hex phx_new 1.8.7 --force
    mix deps.get
fi

echo "[post-create] done."
