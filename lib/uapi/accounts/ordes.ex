defmodule Uapi.Accounts.Ordes do
  use Ecto.Schema
  import Ecto.Changeset

  schema "order" do
    field :price, :integer
    field :status, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(ordes, attrs) do
    ordes
    |> cast(attrs, [:price, :user_id, :status])
    |> validate_required([:price])
  end
end
