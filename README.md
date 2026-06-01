Project kick-off:

mix archive.install hex igniter_new --force
mix archive.install hex phx_new 1.8.7 --force

mix igniter.new flylixir --with phx.new --install ash,ash_phoenix \
  --install ash_postgres,ash_oban --install oban_web,tidewave \
  --install ash_ai --setup --yes

Где flylixir - имя проекта (спроси у пользователя)

* поменял host на "host.docker.internal" в ecto-конфигурации в dev.exs и test.exs
* в .supervisor.json указал правильный cwd для phx.server named tool