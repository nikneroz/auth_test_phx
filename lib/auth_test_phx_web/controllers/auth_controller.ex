defmodule AuthTestPhxWeb.AuthController do
  use AuthTestPhxWeb, :controller

  alias AuthTestPhx.{Repo, Accounts}
  alias AuthTestPhx.Accounts.User

  def new(conn, _params) do
    changeset = User.changeset(%User{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def sign_in(conn, params) do
    conn = scrub_params(conn, "user")

    case Repo.get_by(User, email: params["user"]["email"]) do
      %User{id: id, encrypted_password: encrypted_password} ->
        case Bcrypt.verify_pass(params["user"]["password"], encrypted_password) do
          true ->
            conn
            |> put_session(:current_user_id, id)
            |> put_flash(:info, "Signed up successfully.")
            |> redirect(to: "/users")
          false ->
            conn
            |> delete_session(:current_user_id)
            |> put_flash(:error, "User is not authenticated.")
            |> redirect(to: "/users")
        end
      nil ->
        conn
        |> put_flash(:error, "User is not authenticated.")
        |> redirect(to: "/")
    end
  end

  def sign_out(conn, _params) do
    conn
    |> delete_session(:current_user_id)
    |> redirect(to: "/")
  end
end
