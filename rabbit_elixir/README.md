# RabbitElixir

RabbitMQ Elixir integration

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `rabbit_elixir` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:rabbit_elixir, "~> 0.1.0"}]
    end
    ```

  2. Ensure `rabbit_elixir` is started before your application:

    ```elixir
    def application do
      [applications: [:rabbit_elixir]]
    end
    ```

