defmodule RabbitElixir do
  def queue(),
    do: "rabbit_elixir_ruby_topic"

  def topic(),
    do: System.get_env("RABBIT_ELIXIR_RUBY_TOPIC") || "RABBIT_ELIXIR_RUBY_TOPIC"
end
