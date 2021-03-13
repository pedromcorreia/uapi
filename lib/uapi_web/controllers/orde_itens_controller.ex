defmodule UapiWeb.OrdeItensController do
  use UapiWeb, :controller

  alias Uapi.Accounts
  alias Uapi.Accounts.OrdeItens

  action_fallback UapiWeb.FallbackController

  def index(conn, _params) do
    order_item = Accounts.list_order_item()
    render(conn, "index.json", order_item: order_item)
  end

  def create(conn, %{"orde_itens" => orde_itens_params}) do
    with {:ok, %OrdeItens{} = orde_itens} <- Accounts.create_orde_itens(orde_itens_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.orde_itens_path(conn, :show, orde_itens))
      |> render("show.json", orde_itens: orde_itens)
    end
  end

  def show(conn, %{"id" => id}) do
    orde_itens = Accounts.get_orde_itens!(id)
    render(conn, "show.json", orde_itens: orde_itens)
  end

  def update(conn, %{"id" => id, "orde_itens" => orde_itens_params}) do
    orde_itens = Accounts.get_orde_itens!(id)

    with {:ok, %OrdeItens{} = orde_itens} <-
           Accounts.update_orde_itens(orde_itens, orde_itens_params) do
      render(conn, "show.json", orde_itens: orde_itens)
    end
  end

  def delete(conn, %{"id" => id}) do
    orde_itens = Accounts.get_orde_itens!(id)

    with {:ok, %OrdeItens{}} <- Accounts.delete_orde_itens(orde_itens) do
      send_resp(conn, :no_content, "")
    end
  end
end
