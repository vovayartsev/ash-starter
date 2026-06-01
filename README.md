Project kick-off:

0. there's `<my-super-token>` hardcoded in two files. Find it and replace with the same random value.

1. Open devcontainer in VSCode

2. Tell the user to do `claude mcp add devcontainer --transport http http://localhost:9121/mcp?token=<my-super-token>`

3. read content of .gitignore - it will be erased

4. ask user for <app_name>  (valid Elxir atom name, not ModuleName)

5.  mix phx.new . --app <app_name>

6.  add this to mix.exs:

{:igniter, "~> 0.8", only: [:dev, :test]}

then 

mix deps.get
mix igniter.install ash,ash_phoenix,ash_postgres,ash_oban,oban_web,tidewave,ash_ai --yes

7. change host="host.docker.internal" in ecto config in dev.exs and test.exs

8. add to .gitignore lines from step 0

--- this all takes ~ 5 minutes, tell the user to have some tea ----

