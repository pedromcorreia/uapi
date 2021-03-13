defmodule Uapi.Accounts.Store do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stores" do
    field :latitude, :float
    field :longitude, :float
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(store, attrs) do
    store
    |> cast(attrs, [:latitude, :longitude, :name])
    |> validate_required([:latitude, :longitude, :name])
  end
end
