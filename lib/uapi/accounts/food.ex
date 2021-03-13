defmodule Uapi.Accounts.Food do
  use Ecto.Schema
  import Ecto.Changeset

  schema "foods" do
    field :name, :string
    field :price, :integer
    field :store_id, :id

    timestamps()
  end

  @doc false
  def changeset(food, attrs) do
    food
    |> cast(attrs, [:name, :price])
    |> validate_required([:name, :price])
  end
end
