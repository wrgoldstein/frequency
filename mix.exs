defmodule Frequency.Mixfile do
  use Mix.Project

  def project do
    [app: :frequency,
     version: "0.0.1",
     elixir: "~> 1.2",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {Frequency, []},
     applications: [
      :phoenix, 
      :phoenix_pubsub, 
      :cowboy, 
      :logger, 
      :gettext, 
      :amqp, 
      :briefly,
      :ex_aws,
      :hackney]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.2.1"},
     {:phoenix_pubsub, "~> 1.0"},
     {:gettext, "~> 0.11"},
     {:cowboy, "~> 1.0"},
     {:gen_stage, "~> 0.11"},  # only this or flow
     {:amqp, "~> 0.2.0-pre.1"}, # https://github.com/pma/amqp/issues/28
     {:briefly, "~> 0.3"},
     {:ex_aws, "~> 1.0"},
     {:hackney, "~> 1.6"}
    ]
  end
end
