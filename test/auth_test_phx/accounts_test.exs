defmodule AuthTestPhx.AccountsTest do
  use AuthTestPhx.DataCase

  alias AuthTestPhx.Accounts

  describe "users" do
    alias AuthTestPhx.Accounts.User

    @valid_attrs %{email: "some email", encrypted_password: "some encrypted_password", remember_created_at: ~T[14:00:00], reset_password_sent_at: ~T[14:00:00], reset_password_token: "some reset_password_token"}
    @update_attrs %{email: "some updated email", encrypted_password: "some updated encrypted_password", remember_created_at: ~T[15:01:01], reset_password_sent_at: ~T[15:01:01], reset_password_token: "some updated reset_password_token"}
    @invalid_attrs %{email: nil, encrypted_password: nil, remember_created_at: nil, reset_password_sent_at: nil, reset_password_token: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.encrypted_password == "some encrypted_password"
      assert user.remember_created_at == ~T[14:00:00]
      assert user.reset_password_sent_at == ~T[14:00:00]
      assert user.reset_password_token == "some reset_password_token"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.encrypted_password == "some updated encrypted_password"
      assert user.remember_created_at == ~T[15:01:01]
      assert user.reset_password_sent_at == ~T[15:01:01]
      assert user.reset_password_token == "some updated reset_password_token"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
