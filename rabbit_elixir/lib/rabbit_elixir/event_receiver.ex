defmodule RabbitElixir.EventReceiver do
  @queue "rabbit_elixir_ruby_topic"
  @topic System.get_env("RABBIT_ELIXIR_RUBY_TOPIC") || "RABBIT_ELIXIR_RUBY_TOPIC"

  def start_listening() do
    with {:ok, channel} <- channel() do
      prepare(channel)
      wait_for_messages(channel)
    end
  end

  defp channel() do
    with {:ok, connection} <- AMQP.Connection.open(),
      do: AMQP.Channel.open(connection)
  end

  defp prepare(channel) do
    AMQP.Exchange.declare(channel, @topic, :topic)
    AMQP.Queue.declare(channel, @queue, exclusive: true)
    AMQP.Queue.bind(channel, @queue, @topic)
    AMQP.Basic.consume(channel, @queue, nil, no_ack: true)
  end

  def wait_for_messages(channel) do
    receive do
      {:basic_deliver, payload, _meta} ->
        log_received(payload)
      wait_for_messages(channel)
    end
  end

  defp log_received(payload),
    do: IO.puts "[x] Received #{inspect Poison.Parser.parse!(payload)}"
end



