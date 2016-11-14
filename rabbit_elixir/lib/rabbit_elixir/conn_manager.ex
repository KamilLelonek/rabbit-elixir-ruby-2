defmodule RabbitElixir.ConnManager do
  def channel() do
    with {:ok, connection} <- AMQP.Connection.open(),
      do: AMQP.Channel.open(connection)
  end
end
