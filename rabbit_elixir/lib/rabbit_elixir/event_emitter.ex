defmodule RabbitElixir.EventEmitter do
  import RabbitElixir

  alias RabbitElixir.ConnManager

  def publish(payload) do
    with {:ok, channel} <- ConnManager.channel() do
      prepare(channel)
      publish(channel, payload)
    end
  end

  defp prepare(channel) do
    AMQP.Queue.declare(channel, queue())
    AMQP.Exchange.declare(channel, topic(), :topic)
    AMQP.Queue.bind(channel, queue(), topic())
  end

  def publish(channel, payload),
    do: AMQP.Basic.publish(channel, topic(), "", Poison.encode!(payload))
end
