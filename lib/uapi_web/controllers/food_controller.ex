defmodule UapiWeb.FoodController do
  use UapiWeb, :controller

  alias Uapi.Accounts
  alias Uapi.Accounts.Food

  action_fallback UapiWeb.FallbackController

  def index(conn, _params) do
    foods = Accounts.list_foods()
    render(conn, "index.json", foods: foods)
  end

  def create(conn, %{"food" => food_params}) do
    with {:ok, %Food{} = food} <- Accounts.create_food(food_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.food_path(conn, :show, food))
      |> render("show.json", food: food)
    end
  end

  def show(conn, %{"id" => id}) do
    food = Accounts.get_food!(id)
    render(conn, "show.json", food: food)
  end

  def update(conn, %{"id" => id, "food" => food_params}) do
    food = Accounts.get_food!(id)

    with {:ok, %Food{} = food} <- Accounts.update_food(food, food_params) do
      render(conn, "show.json", food: food)
    end
  end

  def delete(conn, %{"id" => id}) do
    food = Accounts.get_food!(id)

    with {:ok, %Food{}} <- Accounts.delete_food(food) do
      send_resp(conn, :no_content, "")
    end
  end
end
