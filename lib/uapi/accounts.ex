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
end
