module RabbitRuby
  class EventEmitter
    TOPIC = ENV["RABBIT_ELIXIR_RUBY_TOPIC"] || "RABBIT_ELIXIR_RUBY_TOPIC"

    attr_reader :started

    def initialize
      @conn    = Bunny.new
      @started = false
    end

    def prepare
      unless self.started
        conn.start
        self.started = true
      end
    end

    def publish(payload, topic_title = TOPIC)
      raise "Connection not established. Call #prepare firstly!" unless self.started

      topic(topic_title).publish(payload.to_json)
    end

    def shutdown
      if self.started
        conn.close
        self.started = false
      end
    end

    private
    attr_reader :conn
    attr_writer :started

    def topic(topic_title)
      conn
        .create_channel
        .topic(topic_title)
    end
  end
end
