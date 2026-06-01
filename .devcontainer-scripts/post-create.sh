#!/usr/bin/env bash
set -euo pipefail

echo "[post-create] installing uv …"
curl -LsSf https://astral.sh/uv/install.sh | sh
export PATH="$HOME/.local/bin:$PATH"

echo "[post-create] installing serena (stdio MCP server) …"
uv tool install --from git+https://github.com/oraios/serena serena-agent || \
    echo "[post-create] serena install failed (continuing)"

echo "[post-create] installing supervisor-and-mcp-proxy …"
uv tool install --from git+https://github.com/vovayartsev/supervisor_and_mcp_proxy supervisor-and-mcp-proxy

echo "[post-create] mix deps …"
cd /workspaces/app
if [ -f mix.exs ]; then
    mix local.hex --force
    mix local.rebar --force
    mix archive.install hex igniter_new --force
    mix archive.install hex phx_new --force
    mix deps.get
fi

echo "[post-create] done."
