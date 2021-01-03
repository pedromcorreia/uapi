defmodule Uapi.Repo do
  use Ecto.Repo,
    otp_app: :uapi,
    adapter: Ecto.Adapters.Postgres
end
