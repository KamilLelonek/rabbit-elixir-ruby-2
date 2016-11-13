defmodule RabbitElixir.Mixfile do
  use Mix.Project

  def project() do
    [
      app:             :rabbit_elixir,
      version:         "0.1.0",
      elixir:          "~> 1.3",
      build_embedded:  Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps:            deps(),
    ]
  end

  def application() do
    [
      applications: apps(),
    ]
  end

  defp apps() do
    [
      :logger,
      :amqp,
    ]
  end

  defp deps() do
    [
      {:amqp_client, github: "dsrosario/amqp_client", branch: "erlang_otp_19", override: true},
      {:amqp, "0.1.4"},
    ]
  end
end
