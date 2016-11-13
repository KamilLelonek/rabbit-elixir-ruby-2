require_relative "conn_manager"

module RabbitRuby
  class EventReceiver < ConnManager

    def start_listening
      raise "Connection not established. Call #prepare firstly!" unless self.started

      receive
    end

    private
    attr_reader :conn

    def receive
      queue, channel = prepare_queue

      subscribe(queue)
    end

    def prepare_queue
      channel = conn.create_channel
      topic   = channel.topic(TOPIC)
      queue   = channel.queue("", exclusive: true)

      queue.bind(topic)

      [queue, channel]
    end

    def subscribe(queue)
      queue.subscribe(block: true) do |_delivery_info, _properties, body|
        puts JSON.parse(body)
      end
    rescue Interrupt => _
      channel.close
      shutdown
    end
  end
end
