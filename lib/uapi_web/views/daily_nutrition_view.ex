defmodule UapiWeb.DailyNutritionView do
  use UapiWeb, :view
  alias UapiWeb.DailyNutritionView

  def render("index.json", %{daily_nutritions: daily_nutritions}) do
    %{data: render_many(daily_nutritions, DailyNutritionView, "daily_nutrition.json")}
  end

  def render("show.json", %{daily_nutrition: daily_nutrition}) do
    %{data: render_one(daily_nutrition, DailyNutritionView, "daily_nutrition.json")}
  end

  def render("daily_nutrition.json", %{daily_nutrition: daily_nutrition}) do
    %{id: daily_nutrition.id,
      carbs: daily_nutrition.carbs,
      protein: daily_nutrition.protein,
      fat: daily_nutrition.fat}
  end
end
