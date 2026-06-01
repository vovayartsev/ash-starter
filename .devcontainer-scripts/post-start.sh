#!/usr/bin/env bash
set -euo pipefail

export PATH="$HOME/.local/bin:$PATH"

LOG=/tmp/supervisord.log
PID_FILE=/tmp/supervisord.pid

# already running?
if [ -f "$PID_FILE" ] && kill -0 "$(cat "$PID_FILE")" 2>/dev/null; then
    echo "[post-start] supervisor-and-mcp-proxyalready running (pid $(cat $PID_FILE))"
    exit 0
fi

echo "[post-start] starting supervisor-and-mcp-proxy…"
nohup supervisor-and-mcp-proxy -c /workspaces/app/.supervisor.json > "$LOG" 2>&1 &
echo $! > "$PID_FILE"

sleep 1
echo "[post-start] supervisor-and-mcp-proxypid=$(cat $PID_FILE), logs at $LOG"
