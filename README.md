Project kick-off:

0. read content of .gitignore - it will be erased

1. ask user for <app_name>  (valid Elxir atom name, not ModuleName)

2.  mix phx.new . --app <app_name> --yes

3.  add this to mix.exs:

{:igniter, "~> 0.8", only: [:dev, :test]}

then 

mix deps.get
mix igniter.install ash,ash_phoenix,ash_postgres,ash_oban,oban_web,tidewave,ash_ai --yes

4. change host="host.docker.internal" in ecto config in dev.exs and test.exs

5. add to .gitignore lines from step 0