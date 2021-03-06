# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :frequency, Frequency.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "JU1/HiCg0YVUwoG9Ylyr8MelHBOMLOxevHj3Gxyka6iG+HFf+j+hNwcAO6O9+f5I",
  render_errors: [view: Frequency.ErrorView, accepts: ~w(json)],
  pubsub: [name: Frequency.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :frequency, :rabbitmq,
  username: System.get_env("RABBITMQ_USER"),
  password: System.get_env("RABBITMQ_PASSWORD"),
  host: System.get_env("RABBITMQ_HOST"),
  heartbeat: 5

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
