defmodule UapiWeb.FoodView do
  use UapiWeb, :view
  alias UapiWeb.FoodView

  def render("index.json", %{foods: foods}) do
    %{data: render_many(foods, FoodView, "food.json")}
  end

  def render("show.json", %{food: food}) do
    %{data: render_one(food, FoodView, "food.json")}
  end

  def render("food.json", %{food: food}) do
    %{
      id: food.id,
      name: food.name,
      carbs: Enum.random(10..100),
      fat: Enum.random(10..100),
      protein: Enum.random(10..100),
      description: "Alimento super funcional com base em pouca caloria e saboroso",
      price: food.price
    }
  end
end
