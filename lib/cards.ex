defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  @doc """
    Generates a list of cards
  """

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hears", "Diamonds"]

    for suit <- suits,
        value <- values do
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
    Deals a hand to the player from given deck and hand size

  ## Examples
      iex > deck = Cards.create_deck
      iex > hand = Cards.deal(deck, 1)
      ["Ace of Spades"]
  """

  def deal(deck, hand_size) do
    {hand, _rest} = Enum.split(deck, hand_size)
    hand
  end

  @doc """
    Saves the deck to the file system with a given filename
  """

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
    Loads the deck of cards from the file system and handles the error
  """

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "The file #{filename} does not exist"
    end
  end

  @doc """
    Creates a hand to a user with given `hand_size`
  """

  def create_hand(hand_size) do
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end
end
