defmodule Facilier.Repo do
  use Ecto.Repo,
    otp_app: :facilier,
    adapter: Ecto.Adapters.Postgres
end
