Это Elixir-проект в devcontainer. Работай внутри через `mcp__devcontainer__*` tools — они whitelisted и безопасны. Локальные file-edit tools могут быть отвергнуты пользователем.

Описание самих tools и их параметров — в их MCP schemas (видны через ToolSearch). Здесь — только то, что НЕ выводится из schemas:

- Proxy namespacing: upstream MCP-серверы экспортируются под префиксом `<ns>__<orig>` (пустой namespace = без префикса). Вызов proxied tool пока его upstream не `running` → `{"error": "upstream <name> not available, state=<state>"}`.
- Для навигации/редактирования кода используй `serena__*` tools (не локальные Edit/Write).
- Phoenix-сервер зарегистрирован как named_tool `phx.server`. Запускай через `start phx.server`, не сам через bash (иначе проблемы с пробросом портов и кешем).
- После `start phx.server` всегда проверяй `logs phx.server` чтобы убедиться что стартовал.
- Тесты — через `bash` (`mix test ...`).
- Tidewave MCP (Elixir-код, SQL, runtime-логи приложения) требует запущенный phx.server. После старта сначала проверь логи через `logs`, потом можно работать через tidewave.
- Если `mcp__devcontainer__*` недоступны — попроси юзера открыть VSCode в Devcontainer. Сам не стартуй контейнер.
