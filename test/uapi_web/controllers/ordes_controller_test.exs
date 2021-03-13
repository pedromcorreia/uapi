defmodule UapiWeb.OrdesControllerTest do
  use UapiWeb.ConnCase

  alias Uapi.Accounts
  alias Uapi.Accounts.Ordes

  @create_attrs %{
    price: 42
  }
  @update_attrs %{
    price: 43
  }
  @invalid_attrs %{price: nil}

  def fixture(:ordes) do
    {:ok, ordes} = Accounts.create_ordes(@create_attrs)
    ordes
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all order", %{conn: conn} do
      conn = get(conn, Routes.ordes_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create ordes" do
    test "renders ordes when data is valid", %{conn: conn} do
      conn = post(conn, Routes.ordes_path(conn, :create), ordes: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.ordes_path(conn, :show, id))

      assert %{
               "id" => id,
               "price" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.ordes_path(conn, :create), ordes: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update ordes" do
    setup [:create_ordes]

    test "renders ordes when data is valid", %{conn: conn, ordes: %Ordes{id: id} = ordes} do
      conn = put(conn, Routes.ordes_path(conn, :update, ordes), ordes: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.ordes_path(conn, :show, id))

      assert %{
               "id" => id,
               "price" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, ordes: ordes} do
      conn = put(conn, Routes.ordes_path(conn, :update, ordes), ordes: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete ordes" do
    setup [:create_ordes]

    test "deletes chosen ordes", %{conn: conn, ordes: ordes} do
      conn = delete(conn, Routes.ordes_path(conn, :delete, ordes))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.ordes_path(conn, :show, ordes))
      end
    end
  end

  defp create_ordes(_) do
    ordes = fixture(:ordes)
    %{ordes: ordes}
  end
end
