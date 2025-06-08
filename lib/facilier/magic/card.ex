defmodule Facilier.Magic.Card do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mtg_cards" do
    field :name, :string
    field :mana_cost, :string
    field :colors, {:array, :string}
    field :types, {:array, :string}
    field :subtypes, {:array, :string}
    field :rarity, :string
    field :set, :string
    field :text, :string
    field :power, :string
    field :toughness, :string
    field :image_url, :string
    field :reference_id, :string

    timestamps(type: :utc_datetime)
  end

  @rarities ~w(common uncommon rare mythic)

  @doc false
  def changeset(card, attrs) do
    card
    |> cast(attrs, [
      :name,
      :mana_cost,
      :colors,
      :types,
      :subtypes,
      :rarity,
      :set,
      :text,
      :power,
      :toughness,
      :image_url,
      :reference_id
    ])
    |> validate_required([
      :name,
      :mana_cost,
      :colors,
      :types,
      :rarity,
      :set
    ])
    |> validate_inclusion(:rarity, @rarities)
  end
end
