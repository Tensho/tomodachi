# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :tomodachi,
  ecto_repos: [Tomodachi.Repo]

# Configures the endpoint
config :tomodachi, Tomodachi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PauwVIAbRiJBr+4MddJpa+RQ6cuwbDj9rbdRk7r2vdH92qRwnYW8t+PFkZvIoZC5",
  render_errors: [view: Tomodachi.ErrorView, accepts: ~w(json)],
  pubsub: [name: Tomodachi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
