Project kick-off:
1. ask user for <app_name>  (valid Elxir atom name, not ModuleName)

2. 

mix igniter.new . --app <app_name> --with phx.new --install ash,ash_phoenix \
  --install ash_postgres,ash_oban --install oban_web,tidewave \
  --install ash_ai --setup --yes

3. change host="host.docker.internal" in ecto config in dev.exs and test.exs
