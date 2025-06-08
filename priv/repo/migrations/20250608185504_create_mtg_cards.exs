defmodule Facilier.Repo.Migrations.CreateMtgCards do
  use Ecto.Migration

  def change do
    create table(:mtg_cards) do
      add :name, :string
      add :mana_cost, :string
      add :colors, {:array, :string}
      add :types, {:array, :string}
      add :subtypes, {:array, :string}
      add :rarity, :string
      add :set, :string
      add :text, :text
      add :power, :string
      add :toughness, :string
      add :image_url, :string
      add :reference_id, :string

      timestamps(type: :utc_datetime)
    end
  end
end
