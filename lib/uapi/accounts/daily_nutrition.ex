defmodule Uapi.Accounts.DailyNutrition do
  use Ecto.Schema
  import Ecto.Changeset

  schema "daily_nutritions" do
    field :carbs, :integer
    field :fat, :integer
    field :protein, :integer
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(daily_nutrition, attrs) do
    daily_nutrition
    |> cast(attrs, [:carbs, :protein, :fat])
    |> validate_required([:carbs, :protein, :fat])
  end
end
