defmodule UapiWeb.StoreView do
  use UapiWeb, :view
  alias UapiWeb.StoreView

  def render("index.json", %{stores: stores}) do
    %{data: render_many(stores, StoreView, "store.json")}
  end

  def render("show.json", %{store: store}) do
    %{data: render_one(store, StoreView, "store.json")}
  end

  def render("store.json", %{store: store}) do
    %{
      id: store.id,
      latitude: store.latitude,
      longitude: store.longitude,
      distance: 0,
      name: store.name
    }
  end
end
