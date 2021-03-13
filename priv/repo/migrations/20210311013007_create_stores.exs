defmodule Uapi.Repo.Migrations.CreateStores do
  use Ecto.Migration

  def change do
    create table(:stores) do
      add :latitude, :float
      add :longitude, :float
      add :name, :string

      timestamps()
    end

  end
end
