# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :uapi,
  ecto_repos: [Uapi.Repo]

# Configures the endpoint
config :uapi, UapiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nJwTXlabhU+rZodxne3va/S8hBQFq1aUpTE4F+/RRiiSI5Wi4sHiCXbQqcC3lxuO",
  render_errors: [view: UapiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Uapi.PubSub,
  live_view: [signing_salt: "vy3xa6sW"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :uapi, UapiWeb.Auth.Guardian,
  issuer: "uapi",
  secret_key: "6xqYr16QwP75NWTTpbV0qbNAc4qkzvuFnY9XRhm5KvGSmu41Mng1zV3+ytY92DcZ"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
