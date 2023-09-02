defmodule InnerAppWeb.Settings do
  def app_endpoint() do
    Application.get_env(:inner_app, InnerAppWeb.Endpoint)[:endpoint] || InnerAppWeb.Endpoint
  end
end
