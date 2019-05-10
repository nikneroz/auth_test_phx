defmodule AuthTestPhx.Repo do
  use Ecto.Repo,
    otp_app: :auth_test_phx,
    adapter: Ecto.Adapters.Postgres
end
