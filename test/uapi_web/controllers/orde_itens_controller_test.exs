defmodule UapiWeb.OrdeItensControllerTest do
  use UapiWeb.ConnCase

  alias Uapi.Accounts
  alias Uapi.Accounts.OrdeItens

  @create_attrs %{
    quantity: 42
  }
  @update_attrs %{
    quantity: 43
  }
  @invalid_attrs %{quantity: nil}

  def fixture(:orde_itens) do
    {:ok, orde_itens} = Accounts.create_orde_itens(@create_attrs)
    orde_itens
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all order_item", %{conn: conn} do
      conn = get(conn, Routes.orde_itens_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create orde_itens" do
    test "renders orde_itens when data is valid", %{conn: conn} do
      conn = post(conn, Routes.orde_itens_path(conn, :create), orde_itens: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.orde_itens_path(conn, :show, id))

      assert %{
               "id" => id,
               "quantity" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.orde_itens_path(conn, :create), orde_itens: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update orde_itens" do
    setup [:create_orde_itens]

    test "renders orde_itens when data is valid", %{conn: conn, orde_itens: %OrdeItens{id: id} = orde_itens} do
      conn = put(conn, Routes.orde_itens_path(conn, :update, orde_itens), orde_itens: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.orde_itens_path(conn, :show, id))

      assert %{
               "id" => id,
               "quantity" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, orde_itens: orde_itens} do
      conn = put(conn, Routes.orde_itens_path(conn, :update, orde_itens), orde_itens: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete orde_itens" do
    setup [:create_orde_itens]

    test "deletes chosen orde_itens", %{conn: conn, orde_itens: orde_itens} do
      conn = delete(conn, Routes.orde_itens_path(conn, :delete, orde_itens))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.orde_itens_path(conn, :show, orde_itens))
      end
    end
  end

  defp create_orde_itens(_) do
    orde_itens = fixture(:orde_itens)
    %{orde_itens: orde_itens}
  end
end
