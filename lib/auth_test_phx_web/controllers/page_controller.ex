defmodule AuthTestPhxWeb.PageController do
  use AuthTestPhxWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
