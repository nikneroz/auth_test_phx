defmodule AuthTestPhxWeb.Router do
  use AuthTestPhxWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :authenticated do
    plug AuthTestPhxWeb.Plug.Guardian
  end

  scope "/", AuthTestPhxWeb do
    pipe_through :browser

    get "/", AuthController, :new
    post "/sign_in", AuthController, :sign_in
    delete "/sign_out", AuthController, :sign_out

    pipe_through :authenticated # restrict unauthenticated access for routes below
    resources "/users", UserController
  end

  # Other scopes may use custom stacks.
  # scope "/api", AuthTestPhxWeb do
  #   pipe_through :api
  # end
end
