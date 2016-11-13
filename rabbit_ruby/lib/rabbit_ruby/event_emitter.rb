require_relative "conn_manager"

module RabbitRuby
  class EventEmitter < ConnManager
    def publish(payload)
      raise "Connection not established. Call #prepare firstly!" unless self.started

      topic.publish(payload.to_json)
    end

    private
    attr_reader :conn

    def topic
      conn
        .create_channel
        .topic(TOPIC)
    end
  end
end
