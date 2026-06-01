defmodule FlylixirWeb.PageController do
  use FlylixirWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
