defmodule Flylixir.Repo do
  use Ecto.Repo,
    otp_app: :flylixir,
    adapter: Ecto.Adapters.Postgres
end
