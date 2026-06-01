Это Elixir-проект в devcontainer.
внутри devcontainer-а через mcp__devcontainer__* tools
Предпочитай именно их, потому что они whitelisted и безопасны:

| Tool | Args | Returns |
|---|---|---|
| `start` | `tool: str` | `{pid, state}` or `{error: "already running", pid, state}` |
| `stop` | `tool: str, signal="TERM"` | `{stopped, last_exit_code}` |
| `status` | `tool?: str` | one entry or full map (see below) |
| `logs` | `target: str\|int, n=50, stream="all"\|"stdout"\|"stderr", previous=false` | `[{time, stream, message, truncated?}, ...]` — buffer is per-run; `previous=true` returns the prior run's buffer (like `kubectl logs -p`), named tools / mcp_servers only. |
| `bash` | `cmd: str, timeout=30, cwd?, env={}` | `{exit_code, stdout, stderr, duration}` or `{status:"timeout", pid, recent_logs}` |
| `wait` | `pid: int, timeout=60` | `{exit_code, duration}` or `{status:"timeout"}` |
| `kill` | `pid: int, signal="TERM"` | `{killed: bool}` |

Each `mcp_servers.<ns>` upstream exports its own tools under prefix `<ns>__<orig>` (empty namespace = no prefix). Calls to a proxied tool while its upstream is not `running` return `{"error": "upstream <name> not available, state=<state>"}`.

Напротив, локальные инструменты изменения файлов могут вызывать вопросы пользователю
и вероятно будут отвергнуты. Используй `serena` тулзы чтобы навигироваться по коду и изменять его. 
Запускай elixir-сервер как mcp__devcontainer__start (mix phx.server зарегестрирован как "phx.server")
Запускай тесты через `bash`-инструмент.
Проверяй логи запущенного приложения или выполняй Elixir-код или SQL через tidewave MCP tool - для него нужно стартовать phx.server. В процессе запуска phx.server всегда проверяй его логи через devcontainer logs tool чтоб убедиться что он стартовал (после этого можно логи и через Tidewave проверить - чтоб убедиться что он заработал)

Если devcontainer tools не доступны - попроси пользователя запустить VSCode в Devcontainer.
Не стартуй сам - будут проблемы с пробросом портов или кешем.

phoenix-приложение находится в /workspaces/flylixir/flylixir поэтому `mix test` или `mix ash.*` надо запускать оттуда