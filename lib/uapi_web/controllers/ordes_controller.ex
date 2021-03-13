defmodule UapiWeb.OrdesController do
  use UapiWeb, :controller

  alias Uapi.Accounts
  alias Uapi.Accounts.Ordes

  action_fallback UapiWeb.FallbackController

  def index(conn, _params) do
    order = Accounts.list_order(%{user: conn.assigns.current_user})
    render(conn, "index.json", order: order)
  end

  def create(conn, %{"order" => ordes_params}) do
    with {:ok, %Ordes{} = ordes} <-
           Accounts.create_ordes(ordes_params, %{user: conn.assigns.current_user}) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.ordes_path(conn, :show, ordes))
      |> render("show.json", ordes: ordes)
    end
  end

  def show(conn, %{"id" => id}) do
    ordes = Accounts.get_ordes!(id)
    render(conn, "show.json", ordes: ordes)
  end

  def update(conn, %{"id" => id, "ordes" => ordes_params}) do
    ordes = Accounts.get_ordes!(id)

    with {:ok, %Ordes{} = ordes} <- Accounts.update_ordes(ordes, ordes_params) do
      render(conn, "show.json", ordes: ordes)
    end
  end

  def delete(conn, %{"id" => id}) do
    ordes = Accounts.get_ordes!(id)

    with {:ok, %Ordes{}} <- Accounts.delete_ordes(ordes) do
      send_resp(conn, :no_content, "")
    end
  end
end
