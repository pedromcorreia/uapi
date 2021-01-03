defmodule UapiWeb.DailyNutritionControllerTest do
  use UapiWeb.ConnCase

  alias Uapi.Accounts
  alias Uapi.Accounts.DailyNutrition

  @create_attrs %{
    carbs: 42,
    fat: 42,
    protein: 42
  }
  @update_attrs %{
    carbs: 43,
    fat: 43,
    protein: 43
  }
  @invalid_attrs %{carbs: nil, fat: nil, protein: nil}

  def fixture(:daily_nutrition) do
    {:ok, daily_nutrition} = Accounts.create_daily_nutrition(@create_attrs)
    daily_nutrition
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all daily_nutritions", %{conn: conn} do
      conn = get(conn, Routes.daily_nutrition_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create daily_nutrition" do
    test "renders daily_nutrition when data is valid", %{conn: conn} do
      conn = post(conn, Routes.daily_nutrition_path(conn, :create), daily_nutrition: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.daily_nutrition_path(conn, :show, id))

      assert %{
               "id" => id,
               "carbs" => 42,
               "fat" => 42,
               "protein" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.daily_nutrition_path(conn, :create), daily_nutrition: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update daily_nutrition" do
    setup [:create_daily_nutrition]

    test "renders daily_nutrition when data is valid", %{conn: conn, daily_nutrition: %DailyNutrition{id: id} = daily_nutrition} do
      conn = put(conn, Routes.daily_nutrition_path(conn, :update, daily_nutrition), daily_nutrition: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.daily_nutrition_path(conn, :show, id))

      assert %{
               "id" => id,
               "carbs" => 43,
               "fat" => 43,
               "protein" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, daily_nutrition: daily_nutrition} do
      conn = put(conn, Routes.daily_nutrition_path(conn, :update, daily_nutrition), daily_nutrition: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete daily_nutrition" do
    setup [:create_daily_nutrition]

    test "deletes chosen daily_nutrition", %{conn: conn, daily_nutrition: daily_nutrition} do
      conn = delete(conn, Routes.daily_nutrition_path(conn, :delete, daily_nutrition))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.daily_nutrition_path(conn, :show, daily_nutrition))
      end
    end
  end

  defp create_daily_nutrition(_) do
    daily_nutrition = fixture(:daily_nutrition)
    %{daily_nutrition: daily_nutrition}
  end
end
