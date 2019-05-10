# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :auth_test_phx,
  ecto_repos: [AuthTestPhx.Repo]

# Configures the endpoint
config :auth_test_phx, AuthTestPhxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "oPUkNrtWsdbUkF5BAgbmwLn2ov3E+2v4qBrzBembh5XYC5tmv/6oJS36uZicqc1y",
  render_errors: [view: AuthTestPhxWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AuthTestPhx.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
