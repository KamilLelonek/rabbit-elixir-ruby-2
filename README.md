# rabbit-elixir-ruby-2

The second version of a proof of concept - connecting `Ruby` with `Elixir` via RabbitMQ.

You can see the first one [here](https://github.com/KamilLelonek/rabbit-elixir-ruby).

## Prerequisites

1. Make sure you have [`Ruby` installed](https://www.ruby-lang.org/en/documentation/installation/)
2. Make sure you have [`Elixir` installed](http://elixir-lang.org/install.html)
2. Make sure you have [`RabbitMQ` installed](https://www.rabbitmq.com/download.html)

## Setup

You need to run `RabbutMQ` server. To do that execute:

    rabbitmq-server

Now, it's available on your localhost and is waiting to accept any connection.

## Dependencies

Once you have everything installed, you need to fetch all dependencies for each project.

### Elixir

    cd rabbit_elixir
    mix deps.get
    
### Ruby

    cd rabbit_ruby
    bundle

## Usage

There are `EventReceiver` and `EventEmitter` in both projects for your usage. As you may expect, they are responsible for receiving and emitting events correspondingly.

### Elixir

#### `RabbitElixir.EventReceiver`

```elixir
RabbitElixir.EventReceiver.start_listening()
```

#### `RabbitElixir.EventEmitter`

```elixir
RabbitElixir.EventEmitter.publish(%{test: :test})
```

### Ruby

#### `RabbitRuby::EventReceiver`

```ruby
er = RabbitRuby::EventReceiver.new
er.prepare
er.start_listening
# Ctrl-C
er.shutdown
```

#### `RabbitRuby::EventEmitter`

```ruby
ee = RabbitRuby::EventEmitter.new
ee.prepare
ee.publish({test: :test})
ee.shutdown
```
