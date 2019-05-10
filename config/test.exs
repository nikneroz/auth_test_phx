use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :auth_test_phx, AuthTestPhxWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :auth_test_phx, AuthTestPhx.Repo,
  username: "postgres",
  password: "postgres",
  database: "auth_test_phx_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
