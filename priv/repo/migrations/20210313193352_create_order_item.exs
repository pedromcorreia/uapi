defmodule Uapi.Repo.Migrations.CreateOrderItem do
  use Ecto.Migration

  def change do
    create table(:order_item) do
      add(:quantity, :integer)
      add(:order_id, references(:order, on_delete: :nothing))

      timestamps()
    end

    create(index(:order_item, [:order_id]))
  end
end
