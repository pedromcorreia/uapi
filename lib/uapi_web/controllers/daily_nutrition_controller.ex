defmodule UapiWeb.DailyNutritionController do
  use UapiWeb, :controller

  alias Uapi.Accounts
  alias Uapi.Accounts.DailyNutrition

  action_fallback UapiWeb.FallbackController

  def index(conn, _params) do
    daily_nutritions = Accounts.list_daily_nutritions()
    render(conn, "index.json", daily_nutritions: daily_nutritions)
  end

  def create(conn, %{"daily_nutrition" => daily_nutrition_params}) do
    with {:ok, %DailyNutrition{} = daily_nutrition} <- Accounts.create_daily_nutrition(daily_nutrition_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.daily_nutrition_path(conn, :show, daily_nutrition))
      |> render("show.json", daily_nutrition: daily_nutrition)
    end
  end

  def show(conn, %{"id" => id}) do
    daily_nutrition = Accounts.get_daily_nutrition!(id)
    render(conn, "show.json", daily_nutrition: daily_nutrition)
  end

  def update(conn, %{"id" => id, "daily_nutrition" => daily_nutrition_params}) do
    daily_nutrition = Accounts.get_daily_nutrition!(id)

    with {:ok, %DailyNutrition{} = daily_nutrition} <- Accounts.update_daily_nutrition(daily_nutrition, daily_nutrition_params) do
      render(conn, "show.json", daily_nutrition: daily_nutrition)
    end
  end

  def delete(conn, %{"id" => id}) do
    daily_nutrition = Accounts.get_daily_nutrition!(id)

    with {:ok, %DailyNutrition{}} <- Accounts.delete_daily_nutrition(daily_nutrition) do
      send_resp(conn, :no_content, "")
    end
  end
end
