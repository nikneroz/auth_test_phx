defmodule AuthTestPhxWeb.Plug.Guardian do
  @behaviour Plug
  require Logger

  import Plug.Conn
  import Phoenix.Controller

  def init(opts), do: opts

  def call(conn, _) do
    case Plug.Conn.get_session(conn, :current_user_id) do
      nil ->
        conn
        |> put_flash(:error, "User is not authenticated.")
        |> redirect(to: "/")
        |> halt
      _user_id ->
        conn
    end
  end
end
