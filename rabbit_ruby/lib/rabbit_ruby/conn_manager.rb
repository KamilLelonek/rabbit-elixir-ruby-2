module RabbitRuby
  class ConnManager
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

    def shutdown
      if self.started
        conn.close
        self.started = false
      end
    end

    private
    attr_writer :started
  end
end
