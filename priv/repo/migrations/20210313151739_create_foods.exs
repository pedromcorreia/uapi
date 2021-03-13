defmodule Uapi.Repo.Migrations.CreateFoods do
  use Ecto.Migration

  def change do
    create table(:foods) do
      add :name, :string
      add :price, :integer
      add :store_id, references(:stores, on_delete: :nothing)

      timestamps()
    end

    create index(:foods, [:store_id])
  end
end
