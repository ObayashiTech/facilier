defmodule Facilier.MagicFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Facilier.Magic` context.
  """

  @doc """
  Generate a unique set code.
  """
  def unique_set_code, do: "some code#{System.unique_integer([:positive])}"

  @doc """
  Generate a set.
  """
  def set_fixture(attrs \\ %{}) do
    {:ok, set} =
      attrs
      |> Enum.into(%{
        block: "some block",
        code: unique_set_code(),
        name: "some name",
        online_only: true,
        release_date: ~D[2025-06-07],
        set_type: "some set_type"
      })
      |> Facilier.Magic.create_set()

    set
  end

  @doc """
  Generate a card.
  """
  def card_fixture(attrs \\ %{}) do
    {:ok, card} =
      attrs
      |> Enum.into(%{
         : "some  ",
        colors: "some colors",
        mana_cost: "some mana_cost",
        name: "some name"
      })
      |> Facilier.Magic.create_card()

    card
  end
end
