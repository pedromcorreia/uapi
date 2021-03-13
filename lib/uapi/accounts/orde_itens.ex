defmodule Uapi.Accounts.OrdeItens do
  use Ecto.Schema
  import Ecto.Changeset

  schema "order_item" do
    field :quantity, :integer
    field :order_id, :id
    field :food_id, :id

    timestamps()
  end

  @doc false
  def changeset(orde_itens, attrs) do
    orde_itens
    |> cast(attrs, [:quantity, :order_id, :food_id])
    |> validate_required([:quantity])
  end
end
