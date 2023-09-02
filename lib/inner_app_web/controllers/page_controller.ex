defmodule InnerAppWeb.PageController do
  use InnerAppWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.

    IO.inspect(conn.assigns)

    conn
    |> maybe_put_outer_view()
    |> render(:home, layout: false)
  end

  defp maybe_put_outer_view(%{assigns: %{outer_view: test_view}} = conn) do
    conn
    |> put_view(test_view)
  end

  defp maybe_put_outer_view(conn), do: conn
end
