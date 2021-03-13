defmodule UapiWeb.OrdesView do
  use UapiWeb, :view
  alias UapiWeb.OrdesView

  def render("index.json", %{order: order}) do
    %{data: render_many(order, OrdesView, "ordes.json")}
  end

  def render("show.json", %{ordes: ordes}) do
    %{data: render_one(ordes, OrdesView, "ordes.json")}
  end

  def render("ordes.json", %{ordes: ordes}) do
    %{id: ordes.id,
      price: ordes.price}
  end
end
