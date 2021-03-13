defmodule Uapi.Repo.Migrations.CreateOrder do
  use Ecto.Migration

  def change do
    create table(:order) do
      add :price, :integer
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:order, [:user_id])
  end
end
