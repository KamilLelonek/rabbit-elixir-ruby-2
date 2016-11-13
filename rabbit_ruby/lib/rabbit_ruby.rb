require "bunny"
require "json"

require "rabbit_ruby/version"
require "rabbit_ruby/event_emitter"
require "rabbit_ruby/event_receiver"

module RabbitRuby
  TOPIC = ENV["RABBIT_ELIXIR_RUBY_TOPIC"] || "RABBIT_ELIXIR_RUBY_TOPIC"
end
