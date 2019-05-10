defmodule AuthTestPhx.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @timestamps_opts inserted_at: :created_at

  schema "users" do
    field :email, :string
    field :password, :string, virtual: true
    field :encrypted_password, :string
    field :remember_created_at, :time
    field :reset_password_sent_at, :time
    field :reset_password_token, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at])
    |> validate_required([:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at])
  end
end
