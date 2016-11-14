defmodule RabbitElixir.EventReceiver do
  import RabbitElixir

  alias RabbitElixir.ConnManager

  def start_listening() do
    with {:ok, channel} <- ConnManager.channel() do
      prepare(channel)
      wait_for_messages(channel)
    end
  end

  defp prepare(channel) do
    AMQP.Exchange.declare(channel, topic(), :topic)
    AMQP.Queue.declare(channel, queue(), exclusive: true)
    AMQP.Queue.bind(channel, queue(), topic())
    AMQP.Basic.consume(channel, queue(), nil, no_ack: true)
  end

  defp wait_for_messages(channel) do
    receive do
      {:basic_deliver, payload, _meta} ->
        log_received(payload)
      wait_for_messages(channel)
    end
  end

  defp log_received(payload),
    do: IO.puts "[x] Received #{inspect Poison.Parser.parse!(payload)}"
end
