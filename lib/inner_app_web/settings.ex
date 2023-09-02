defmodule InnerAppWeb.Settings do
  def app_endpoint() do
    case Application.get_env(:inner_app, InnerAppWeb.Endpoint)[:endpoint] do
      nil -> InnerAppWeb.Endpoint
      endpoint -> String.to_atom(endpoint)
    end
  end
end
