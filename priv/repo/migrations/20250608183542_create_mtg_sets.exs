defmodule Facilier.Repo.Migrations.CreateMtgSets do
  use Ecto.Migration

  def change do
    create table(:mtg_sets) do
      add :name, :string
      add :code, :string
      add :set_type, :string
      add :block, :string
      add :release_date, :date
      add :online_only, :boolean, default: false, null: false

      timestamps(type: :utc_datetime)
    end

    create unique_index(:mtg_sets, [:code])
  end
end
