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
    ]
  end

  defp deps() do
    []
  end
end
