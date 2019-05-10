defmodule AuthTestPhx.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :encrypted_password, :string
      add :reset_password_token, :string
      add :reset_password_sent_at, :time
      add :remember_created_at, :time

      timestamps()
    end

  end
end
