defmodule Uapi.Repo.Migrations.CreateDailyNutritions do
  use Ecto.Migration

  def change do
    create table(:daily_nutritions) do
      add :carbs, :integer
      add :protein, :integer
      add :fat, :integer
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:daily_nutritions, [:user_id])
  end
end
