defmodule Cards do
  @moduledoc """
  Documentation for Cards.
  """

  @doc """
    Generates a list of cards
  """

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hears", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Shuffles the deck of cards
  """

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Checks if the deck contains a given card
  """

  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end

  @doc """

  """

  def deal(deck, hand_size) do
    {hand, rest} = Enum.split(deck, hand_size)
    [hand, rest]
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "The file #{filename} does not exist"
    end
  end

  def create_hand(hand_size) do

  end

end
