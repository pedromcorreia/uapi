defmodule Uapi.AccountsTest do
  use Uapi.DataCase

  alias Uapi.Accounts

  describe "users" do
    alias Uapi.Accounts.User

    @valid_attrs %{email: "some email", encrypted_password: "some encrypted_password"}
    @update_attrs %{email: "some updated email", encrypted_password: "some updated encrypted_password"}
    @invalid_attrs %{email: nil, encrypted_password: nil}

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
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.encrypted_password == "some updated encrypted_password"
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

  describe "daily_nutritions" do
    alias Uapi.Accounts.DailyNutrition

    @valid_attrs %{carbs: 42, fat: 42, protein: 42}
    @update_attrs %{carbs: 43, fat: 43, protein: 43}
    @invalid_attrs %{carbs: nil, fat: nil, protein: nil}

    def daily_nutrition_fixture(attrs \\ %{}) do
      {:ok, daily_nutrition} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_daily_nutrition()

      daily_nutrition
    end

    test "list_daily_nutritions/0 returns all daily_nutritions" do
      daily_nutrition = daily_nutrition_fixture()
      assert Accounts.list_daily_nutritions() == [daily_nutrition]
    end

    test "get_daily_nutrition!/1 returns the daily_nutrition with given id" do
      daily_nutrition = daily_nutrition_fixture()
      assert Accounts.get_daily_nutrition!(daily_nutrition.id) == daily_nutrition
    end

    test "create_daily_nutrition/1 with valid data creates a daily_nutrition" do
      assert {:ok, %DailyNutrition{} = daily_nutrition} = Accounts.create_daily_nutrition(@valid_attrs)
      assert daily_nutrition.carbs == 42
      assert daily_nutrition.fat == 42
      assert daily_nutrition.protein == 42
    end

    test "create_daily_nutrition/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_daily_nutrition(@invalid_attrs)
    end

    test "update_daily_nutrition/2 with valid data updates the daily_nutrition" do
      daily_nutrition = daily_nutrition_fixture()
      assert {:ok, %DailyNutrition{} = daily_nutrition} = Accounts.update_daily_nutrition(daily_nutrition, @update_attrs)
      assert daily_nutrition.carbs == 43
      assert daily_nutrition.fat == 43
      assert daily_nutrition.protein == 43
    end

    test "update_daily_nutrition/2 with invalid data returns error changeset" do
      daily_nutrition = daily_nutrition_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_daily_nutrition(daily_nutrition, @invalid_attrs)
      assert daily_nutrition == Accounts.get_daily_nutrition!(daily_nutrition.id)
    end

    test "delete_daily_nutrition/1 deletes the daily_nutrition" do
      daily_nutrition = daily_nutrition_fixture()
      assert {:ok, %DailyNutrition{}} = Accounts.delete_daily_nutrition(daily_nutrition)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_daily_nutrition!(daily_nutrition.id) end
    end

    test "change_daily_nutrition/1 returns a daily_nutrition changeset" do
      daily_nutrition = daily_nutrition_fixture()
      assert %Ecto.Changeset{} = Accounts.change_daily_nutrition(daily_nutrition)
    end
  end
end
