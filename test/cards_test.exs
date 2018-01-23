defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "returns a list of cards" do
    assert Cards.create_deck() == ["Ace", "Two", "Three"]
  end
end
