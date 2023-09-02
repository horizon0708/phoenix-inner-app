defmodule InnerApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      InnerAppWeb.Telemetry,
      # Start the Ecto repository
      InnerApp.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: InnerApp.PubSub},
      # Start Finch
      {Finch, name: InnerApp.Finch},
      # Start the Endpoint (http/https)
      InnerAppWeb.Endpoint
      # Start a worker by calling: InnerApp.Worker.start_link(arg)
      # {InnerApp.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: InnerApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    InnerAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
