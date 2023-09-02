defmodule InnerApp.Repo do
  use Ecto.Repo,
    otp_app: :inner_app,
    adapter: Ecto.Adapters.Postgres
end
