defmodule UapiWeb.OrdeItensView do
  use UapiWeb, :view
  alias UapiWeb.OrdeItensView

  def render("index.json", %{order_item: order_item}) do
    %{data: render_many(order_item, OrdeItensView, "orde_itens.json")}
  end

  def render("show.json", %{orde_itens: orde_itens}) do
    %{data: render_one(orde_itens, OrdeItensView, "orde_itens.json")}
  end

  def render("orde_itens.json", %{orde_itens: orde_itens}) do
    %{id: orde_itens.id,
      quantity: orde_itens.quantity}
  end
end
