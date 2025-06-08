defmodule Facilier.Magic.Set do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mtg_sets" do
    field :block, :string
    field :code, :string
    field :name, :string
    field :set_type, :string
    field :release_date, :date
    field :online_only, :boolean, default: false

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(set, attrs) do
    set
    |> cast(attrs, [:name, :code, :set_type, :block, :release_date, :online_only])
    |> validate_required([:name, :code, :set_type, :block, :release_date, :online_only])
    |> unique_constraint(:code)
  end
end
