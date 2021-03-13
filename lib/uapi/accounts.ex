defmodule Uapi.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Uapi.Repo

  alias Uapi.Accounts.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{data: %User{}}

  """
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end

  def get_by_email(email) do
    case Repo.get_by(User, email: email) do
      nil ->
        {:error, :not_found}

      user ->
        {:ok, user}
    end
  end

  alias Uapi.Accounts.DailyNutrition

  @doc """
  Returns the list of daily_nutritions.

  ## Examples

      iex> list_daily_nutritions()
      [%DailyNutrition{}, ...]

  """
  def list_daily_nutritions do
    Repo.all(DailyNutrition)
  end

  @doc """
  Gets a single daily_nutrition.

  Raises `Ecto.NoResultsError` if the Daily nutrition does not exist.

  ## Examples

      iex> get_daily_nutrition!(123)
      %DailyNutrition{}

      iex> get_daily_nutrition!(456)
      ** (Ecto.NoResultsError)

  """
  def get_daily_nutrition!(id), do: Repo.get!(DailyNutrition, id)

  @doc """
  Creates a daily_nutrition.

  ## Examples

      iex> create_daily_nutrition(%{field: value})
      {:ok, %DailyNutrition{}}

      iex> create_daily_nutrition(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_daily_nutrition(attrs \\ %{}) do
    %DailyNutrition{}
    |> DailyNutrition.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a daily_nutrition.

  ## Examples

      iex> update_daily_nutrition(daily_nutrition, %{field: new_value})
      {:ok, %DailyNutrition{}}

      iex> update_daily_nutrition(daily_nutrition, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_daily_nutrition(%DailyNutrition{} = daily_nutrition, attrs) do
    daily_nutrition
    |> DailyNutrition.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a daily_nutrition.

  ## Examples

      iex> delete_daily_nutrition(daily_nutrition)
      {:ok, %DailyNutrition{}}

      iex> delete_daily_nutrition(daily_nutrition)
      {:error, %Ecto.Changeset{}}

  """
  def delete_daily_nutrition(%DailyNutrition{} = daily_nutrition) do
    Repo.delete(daily_nutrition)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking daily_nutrition changes.

  ## Examples

      iex> change_daily_nutrition(daily_nutrition)
      %Ecto.Changeset{data: %DailyNutrition{}}

  """
  def change_daily_nutrition(%DailyNutrition{} = daily_nutrition, attrs \\ %{}) do
    DailyNutrition.changeset(daily_nutrition, attrs)
  end

  alias Uapi.Accounts.Store

  @doc """
  Returns the list of stores.

  ## Examples

      iex> list_stores()
      [%Store{}, ...]

  """
  def list_stores do
    Repo.all(Store)
  end

  @doc """
  Gets a single store.

  Raises `Ecto.NoResultsError` if the Store does not exist.

  ## Examples

      iex> get_store!(123)
      %Store{}

      iex> get_store!(456)
      ** (Ecto.NoResultsError)

  """
  def get_store!(id), do: Repo.get!(Store, id)

  @doc """
  Creates a store.

  ## Examples

      iex> create_store(%{field: value})
      {:ok, %Store{}}

      iex> create_store(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_store(attrs \\ %{}) do
    %Store{}
    |> Store.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a store.

  ## Examples

      iex> update_store(store, %{field: new_value})
      {:ok, %Store{}}

      iex> update_store(store, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_store(%Store{} = store, attrs) do
    store
    |> Store.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a store.

  ## Examples

      iex> delete_store(store)
      {:ok, %Store{}}

      iex> delete_store(store)
      {:error, %Ecto.Changeset{}}

  """
  def delete_store(%Store{} = store) do
    Repo.delete(store)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking store changes.

  ## Examples

      iex> change_store(store)
      %Ecto.Changeset{data: %Store{}}

  """
  def change_store(%Store{} = store, attrs \\ %{}) do
    Store.changeset(store, attrs)
  end

  alias Uapi.Accounts.Food

  @doc """
  Returns the list of foods.

  ## Examples

      iex> list_foods()
      [%Food{}, ...]

  """
  def list_foods do
    Repo.all(Food)
  end

  @doc """
  Gets a single food.

  Raises `Ecto.NoResultsError` if the Food does not exist.

  ## Examples

      iex> get_food!(123)
      %Food{}

      iex> get_food!(456)
      ** (Ecto.NoResultsError)

  """
  def get_food!(id), do: Repo.get!(Food, id)

  @doc """
  Creates a food.

  ## Examples

      iex> create_food(%{field: value})
      {:ok, %Food{}}

      iex> create_food(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_food(attrs \\ %{}) do
    %Food{}
    |> Food.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a food.

  ## Examples

      iex> update_food(food, %{field: new_value})
      {:ok, %Food{}}

      iex> update_food(food, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_food(%Food{} = food, attrs) do
    food
    |> Food.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a food.

  ## Examples

      iex> delete_food(food)
      {:ok, %Food{}}

      iex> delete_food(food)
      {:error, %Ecto.Changeset{}}

  """
  def delete_food(%Food{} = food) do
    Repo.delete(food)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking food changes.

  ## Examples

      iex> change_food(food)
      %Ecto.Changeset{data: %Food{}}

  """
  def change_food(%Food{} = food, attrs \\ %{}) do
    Food.changeset(food, attrs)
  end

  alias Uapi.Accounts.Ordes

  @doc """
  Returns the list of order.

  ## Examples

      iex> list_order()
      [%Ordes{}, ...]

  """
  def list_order(%{user: user}) do
    q = from m in Ordes, where: m.user_id == ^user.id
    Repo.all(q)
  end

  @doc """
  Gets a single ordes.

  Raises `Ecto.NoResultsError` if the Ordes does not exist.

  ## Examples

      iex> get_ordes!(123)
      %Ordes{}

      iex> get_ordes!(456)
      ** (Ecto.NoResultsError)

  """
  def get_ordes!(id), do: Repo.get!(Ordes, id)

  @doc """
  Creates a ordes.

  ## Examples

      iex> create_ordes(%{field: value})
      {:ok, %Ordes{}}

      iex> create_ordes(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_ordes(attrs \\ %{}, %{user: user}) do
    quantity = Enum.reduce(attrs, 0, fn x, acc -> x["quantity"] + acc end)

    IO.inspect(user.id)

    order =
      %Ordes{}
      |> Ordes.changeset(%{price: quantity, user_id: user.id})
      |> Repo.insert()
      |> IO.inspect()

    Enum.map(attrs, fn x ->
      create_orde_itens(%{order: order, food_id: x["id"], quantity: x["quantity"]})
    end)

    order
  end

  @doc """
  Updates a ordes.

  ## Examples

      iex> update_ordes(ordes, %{field: new_value})
      {:ok, %Ordes{}}

      iex> update_ordes(ordes, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_ordes(%Ordes{} = ordes, attrs) do
    ordes
    |> Ordes.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ordes.

  ## Examples

      iex> delete_ordes(ordes)
      {:ok, %Ordes{}}

      iex> delete_ordes(ordes)
      {:error, %Ecto.Changeset{}}

  """
  def delete_ordes(%Ordes{} = ordes) do
    Repo.delete(ordes)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking ordes changes.

  ## Examples

      iex> change_ordes(ordes)
      %Ecto.Changeset{data: %Ordes{}}

  """
  def change_ordes(%Ordes{} = ordes, attrs \\ %{}) do
    Ordes.changeset(ordes, attrs)
  end

  alias Uapi.Accounts.OrdeItens

  @doc """
  Returns the list of order_iten.

  ## Examples

      iex> list_order_iten()
      [%OrdeItens{}, ...]

  """
  def list_order_iten do
    Repo.all(OrdeItens)
  end

  @doc """
  Gets a single orde_itens.

  Raises `Ecto.NoResultsError` if the Orde itens does not exist.

  ## Examples

      iex> get_orde_itens!(123)
      %OrdeItens{}

      iex> get_orde_itens!(456)
      ** (Ecto.NoResultsError)

  """
  def get_orde_itens!(id), do: Repo.get!(OrdeItens, id)

  @doc """
  Creates a orde_itens.

  ## Examples

      iex> create_orde_itens(%{field: value})
      {:ok, %OrdeItens{}}

      iex> create_orde_itens(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_orde_itens(attrs \\ %{}) do
    %OrdeItens{}
    |> OrdeItens.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a orde_itens.

  ## Examples

      iex> update_orde_itens(orde_itens, %{field: new_value})
      {:ok, %OrdeItens{}}

      iex> update_orde_itens(orde_itens, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_orde_itens(%OrdeItens{} = orde_itens, attrs) do
    orde_itens
    |> OrdeItens.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a orde_itens.

  ## Examples

      iex> delete_orde_itens(orde_itens)
      {:ok, %OrdeItens{}}

      iex> delete_orde_itens(orde_itens)
      {:error, %Ecto.Changeset{}}

  """
  def delete_orde_itens(%OrdeItens{} = orde_itens) do
    Repo.delete(orde_itens)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking orde_itens changes.

  ## Examples

      iex> change_orde_itens(orde_itens)
      %Ecto.Changeset{data: %OrdeItens{}}

  """
  def change_orde_itens(%OrdeItens{} = orde_itens, attrs \\ %{}) do
    OrdeItens.changeset(orde_itens, attrs)
  end
end
