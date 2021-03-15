defmodule Uapi.Repo.Migrations.AddStatusToOrder do
  use Ecto.Migration

  def change do
    alter table(:order) do
      add(:status, :string, default: "preparando")
    end
  end
end
