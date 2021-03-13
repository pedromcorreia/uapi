defmodule UapiWeb.StoreController do
  use UapiWeb, :controller

  alias Uapi.Accounts
  alias Uapi.Accounts.Store

  action_fallback UapiWeb.FallbackController

  def index(conn, _params) do
    stores = Accounts.list_stores()
    render(conn, "index.json", stores: stores)
  end

  def create(conn, %{"store" => store_params}) do
    with {:ok, %Store{} = store} <- Accounts.create_store(store_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.store_path(conn, :show, store))
      |> render("show.json", store: store)
    end
  end

  def show(conn, %{"id" => id}) do
    store = Accounts.get_store!(id)
    render(conn, "show.json", store: store)
  end

  def update(conn, %{"id" => id, "store" => store_params}) do
    store = Accounts.get_store!(id)

    with {:ok, %Store{} = store} <- Accounts.update_store(store, store_params) do
      render(conn, "show.json", store: store)
    end
  end

  def delete(conn, %{"id" => id}) do
    store = Accounts.get_store!(id)

    with {:ok, %Store{}} <- Accounts.delete_store(store) do
      send_resp(conn, :no_content, "")
    end
  end
end
