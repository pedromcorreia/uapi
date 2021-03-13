defmodule Uapi.Repo.Migrations.AddOrderItemToItem do
  use Ecto.Migration

  def change do
    alter table(:order_item) do
      add(:food_id, references(:foods, on_delete: :nothing))
    end
  end
end
