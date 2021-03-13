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

  describe "stores" do
    alias Uapi.Accounts.Store

    @valid_attrs %{latitude: 120.5, longitude: 120.5, name: "some name"}
    @update_attrs %{latitude: 456.7, longitude: 456.7, name: "some updated name"}
    @invalid_attrs %{latitude: nil, longitude: nil, name: nil}

    def store_fixture(attrs \\ %{}) do
      {:ok, store} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_store()

      store
    end

    test "list_stores/0 returns all stores" do
      store = store_fixture()
      assert Accounts.list_stores() == [store]
    end

    test "get_store!/1 returns the store with given id" do
      store = store_fixture()
      assert Accounts.get_store!(store.id) == store
    end

    test "create_store/1 with valid data creates a store" do
      assert {:ok, %Store{} = store} = Accounts.create_store(@valid_attrs)
      assert store.latitude == 120.5
      assert store.longitude == 120.5
      assert store.name == "some name"
    end

    test "create_store/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_store(@invalid_attrs)
    end

    test "update_store/2 with valid data updates the store" do
      store = store_fixture()
      assert {:ok, %Store{} = store} = Accounts.update_store(store, @update_attrs)
      assert store.latitude == 456.7
      assert store.longitude == 456.7
      assert store.name == "some updated name"
    end

    test "update_store/2 with invalid data returns error changeset" do
      store = store_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_store(store, @invalid_attrs)
      assert store == Accounts.get_store!(store.id)
    end

    test "delete_store/1 deletes the store" do
      store = store_fixture()
      assert {:ok, %Store{}} = Accounts.delete_store(store)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_store!(store.id) end
    end

    test "change_store/1 returns a store changeset" do
      store = store_fixture()
      assert %Ecto.Changeset{} = Accounts.change_store(store)
    end
  end

  describe "foods" do
    alias Uapi.Accounts.Food

    @valid_attrs %{name: "some name", price: 42}
    @update_attrs %{name: "some updated name", price: 43}
    @invalid_attrs %{name: nil, price: nil}

    def food_fixture(attrs \\ %{}) do
      {:ok, food} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_food()

      food
    end

    test "list_foods/0 returns all foods" do
      food = food_fixture()
      assert Accounts.list_foods() == [food]
    end

    test "get_food!/1 returns the food with given id" do
      food = food_fixture()
      assert Accounts.get_food!(food.id) == food
    end

    test "create_food/1 with valid data creates a food" do
      assert {:ok, %Food{} = food} = Accounts.create_food(@valid_attrs)
      assert food.name == "some name"
      assert food.price == 42
    end

    test "create_food/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_food(@invalid_attrs)
    end

    test "update_food/2 with valid data updates the food" do
      food = food_fixture()
      assert {:ok, %Food{} = food} = Accounts.update_food(food, @update_attrs)
      assert food.name == "some updated name"
      assert food.price == 43
    end

    test "update_food/2 with invalid data returns error changeset" do
      food = food_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_food(food, @invalid_attrs)
      assert food == Accounts.get_food!(food.id)
    end

    test "delete_food/1 deletes the food" do
      food = food_fixture()
      assert {:ok, %Food{}} = Accounts.delete_food(food)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_food!(food.id) end
    end

    test "change_food/1 returns a food changeset" do
      food = food_fixture()
      assert %Ecto.Changeset{} = Accounts.change_food(food)
    end
  end

  describe "order" do
    alias Uapi.Accounts.Ordes

    @valid_attrs %{price: 42}
    @update_attrs %{price: 43}
    @invalid_attrs %{price: nil}

    def ordes_fixture(attrs \\ %{}) do
      {:ok, ordes} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_ordes()

      ordes
    end

    test "list_order/0 returns all order" do
      ordes = ordes_fixture()
      assert Accounts.list_order() == [ordes]
    end

    test "get_ordes!/1 returns the ordes with given id" do
      ordes = ordes_fixture()
      assert Accounts.get_ordes!(ordes.id) == ordes
    end

    test "create_ordes/1 with valid data creates a ordes" do
      assert {:ok, %Ordes{} = ordes} = Accounts.create_ordes(@valid_attrs)
      assert ordes.price == 42
    end

    test "create_ordes/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_ordes(@invalid_attrs)
    end

    test "update_ordes/2 with valid data updates the ordes" do
      ordes = ordes_fixture()
      assert {:ok, %Ordes{} = ordes} = Accounts.update_ordes(ordes, @update_attrs)
      assert ordes.price == 43
    end

    test "update_ordes/2 with invalid data returns error changeset" do
      ordes = ordes_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_ordes(ordes, @invalid_attrs)
      assert ordes == Accounts.get_ordes!(ordes.id)
    end

    test "delete_ordes/1 deletes the ordes" do
      ordes = ordes_fixture()
      assert {:ok, %Ordes{}} = Accounts.delete_ordes(ordes)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_ordes!(ordes.id) end
    end

    test "change_ordes/1 returns a ordes changeset" do
      ordes = ordes_fixture()
      assert %Ecto.Changeset{} = Accounts.change_ordes(ordes)
    end
  end

  describe "order_iten" do
    alias Uapi.Accounts.OrdeItens

    @valid_attrs %{quantity: 42}
    @update_attrs %{quantity: 43}
    @invalid_attrs %{quantity: nil}

    def orde_itens_fixture(attrs \\ %{}) do
      {:ok, orde_itens} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_orde_itens()

      orde_itens
    end

    test "list_order_iten/0 returns all order_iten" do
      orde_itens = orde_itens_fixture()
      assert Accounts.list_order_iten() == [orde_itens]
    end

    test "get_orde_itens!/1 returns the orde_itens with given id" do
      orde_itens = orde_itens_fixture()
      assert Accounts.get_orde_itens!(orde_itens.id) == orde_itens
    end

    test "create_orde_itens/1 with valid data creates a orde_itens" do
      assert {:ok, %OrdeItens{} = orde_itens} = Accounts.create_orde_itens(@valid_attrs)
      assert orde_itens.quantity == 42
    end

    test "create_orde_itens/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_orde_itens(@invalid_attrs)
    end

    test "update_orde_itens/2 with valid data updates the orde_itens" do
      orde_itens = orde_itens_fixture()
      assert {:ok, %OrdeItens{} = orde_itens} = Accounts.update_orde_itens(orde_itens, @update_attrs)
      assert orde_itens.quantity == 43
    end

    test "update_orde_itens/2 with invalid data returns error changeset" do
      orde_itens = orde_itens_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_orde_itens(orde_itens, @invalid_attrs)
      assert orde_itens == Accounts.get_orde_itens!(orde_itens.id)
    end

    test "delete_orde_itens/1 deletes the orde_itens" do
      orde_itens = orde_itens_fixture()
      assert {:ok, %OrdeItens{}} = Accounts.delete_orde_itens(orde_itens)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_orde_itens!(orde_itens.id) end
    end

    test "change_orde_itens/1 returns a orde_itens changeset" do
      orde_itens = orde_itens_fixture()
      assert %Ecto.Changeset{} = Accounts.change_orde_itens(orde_itens)
    end
  end

  describe "order_item" do
    alias Uapi.Accounts.OrdeItens

    @valid_attrs %{quantity: 42}
    @update_attrs %{quantity: 43}
    @invalid_attrs %{quantity: nil}

    def orde_itens_fixture(attrs \\ %{}) do
      {:ok, orde_itens} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_orde_itens()

      orde_itens
    end

    test "list_order_item/0 returns all order_item" do
      orde_itens = orde_itens_fixture()
      assert Accounts.list_order_item() == [orde_itens]
    end

    test "get_orde_itens!/1 returns the orde_itens with given id" do
      orde_itens = orde_itens_fixture()
      assert Accounts.get_orde_itens!(orde_itens.id) == orde_itens
    end

    test "create_orde_itens/1 with valid data creates a orde_itens" do
      assert {:ok, %OrdeItens{} = orde_itens} = Accounts.create_orde_itens(@valid_attrs)
      assert orde_itens.quantity == 42
    end

    test "create_orde_itens/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_orde_itens(@invalid_attrs)
    end

    test "update_orde_itens/2 with valid data updates the orde_itens" do
      orde_itens = orde_itens_fixture()
      assert {:ok, %OrdeItens{} = orde_itens} = Accounts.update_orde_itens(orde_itens, @update_attrs)
      assert orde_itens.quantity == 43
    end

    test "update_orde_itens/2 with invalid data returns error changeset" do
      orde_itens = orde_itens_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_orde_itens(orde_itens, @invalid_attrs)
      assert orde_itens == Accounts.get_orde_itens!(orde_itens.id)
    end

    test "delete_orde_itens/1 deletes the orde_itens" do
      orde_itens = orde_itens_fixture()
      assert {:ok, %OrdeItens{}} = Accounts.delete_orde_itens(orde_itens)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_orde_itens!(orde_itens.id) end
    end

    test "change_orde_itens/1 returns a orde_itens changeset" do
      orde_itens = orde_itens_fixture()
      assert %Ecto.Changeset{} = Accounts.change_orde_itens(orde_itens)
    end
  end
end
