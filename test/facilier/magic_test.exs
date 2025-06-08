defmodule Facilier.MagicTest do
  use Facilier.DataCase

  alias Facilier.Magic

  describe "mtg_sets" do
    alias Facilier.Magic.Set

    import Facilier.MagicFixtures

    @invalid_attrs %{block: nil, code: nil, name: nil, set_type: nil, release_date: nil, online_only: nil}

    test "list_mtg_sets/0 returns all mtg_sets" do
      set = set_fixture()
      assert Magic.list_mtg_sets() == [set]
    end

    test "get_set!/1 returns the set with given id" do
      set = set_fixture()
      assert Magic.get_set!(set.id) == set
    end

    test "create_set/1 with valid data creates a set" do
      valid_attrs = %{block: "some block", code: "some code", name: "some name", set_type: "some set_type", release_date: ~D[2025-06-07], online_only: true}

      assert {:ok, %Set{} = set} = Magic.create_set(valid_attrs)
      assert set.block == "some block"
      assert set.code == "some code"
      assert set.name == "some name"
      assert set.set_type == "some set_type"
      assert set.release_date == ~D[2025-06-07]
      assert set.online_only == true
    end

    test "create_set/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Magic.create_set(@invalid_attrs)
    end

    test "update_set/2 with valid data updates the set" do
      set = set_fixture()
      update_attrs = %{block: "some updated block", code: "some updated code", name: "some updated name", set_type: "some updated set_type", release_date: ~D[2025-06-08], online_only: false}

      assert {:ok, %Set{} = set} = Magic.update_set(set, update_attrs)
      assert set.block == "some updated block"
      assert set.code == "some updated code"
      assert set.name == "some updated name"
      assert set.set_type == "some updated set_type"
      assert set.release_date == ~D[2025-06-08]
      assert set.online_only == false
    end

    test "update_set/2 with invalid data returns error changeset" do
      set = set_fixture()
      assert {:error, %Ecto.Changeset{}} = Magic.update_set(set, @invalid_attrs)
      assert set == Magic.get_set!(set.id)
    end

    test "delete_set/1 deletes the set" do
      set = set_fixture()
      assert {:ok, %Set{}} = Magic.delete_set(set)
      assert_raise Ecto.NoResultsError, fn -> Magic.get_set!(set.id) end
    end

    test "change_set/1 returns a set changeset" do
      set = set_fixture()
      assert %Ecto.Changeset{} = Magic.change_set(set)
    end
  end

  describe "mtg_cards" do
    alias Facilier.Magic.Card

    import Facilier.MagicFixtures

    @invalid_attrs %{name: nil, colors: nil, mana_cost: nil, " ": nil}

    test "list_mtg_cards/0 returns all mtg_cards" do
      card = card_fixture()
      assert Magic.list_mtg_cards() == [card]
    end

    test "get_card!/1 returns the card with given id" do
      card = card_fixture()
      assert Magic.get_card!(card.id) == card
    end

    test "create_card/1 with valid data creates a card" do
      valid_attrs = %{name: "some name", colors: "some colors", mana_cost: "some mana_cost", " ": "some  "}

      assert {:ok, %Card{} = card} = Magic.create_card(valid_attrs)
      assert card.name == "some name"
      assert card.colors == "some colors"
      assert card.mana_cost == "some mana_cost"
      assert card.  == "some  "
    end

    test "create_card/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Magic.create_card(@invalid_attrs)
    end

    test "update_card/2 with valid data updates the card" do
      card = card_fixture()
      update_attrs = %{name: "some updated name", colors: "some updated colors", mana_cost: "some updated mana_cost", " ": "some updated  "}

      assert {:ok, %Card{} = card} = Magic.update_card(card, update_attrs)
      assert card.name == "some updated name"
      assert card.colors == "some updated colors"
      assert card.mana_cost == "some updated mana_cost"
      assert card.  == "some updated  "
    end

    test "update_card/2 with invalid data returns error changeset" do
      card = card_fixture()
      assert {:error, %Ecto.Changeset{}} = Magic.update_card(card, @invalid_attrs)
      assert card == Magic.get_card!(card.id)
    end

    test "delete_card/1 deletes the card" do
      card = card_fixture()
      assert {:ok, %Card{}} = Magic.delete_card(card)
      assert_raise Ecto.NoResultsError, fn -> Magic.get_card!(card.id) end
    end

    test "change_card/1 returns a card changeset" do
      card = card_fixture()
      assert %Ecto.Changeset{} = Magic.change_card(card)
    end
  end
end
