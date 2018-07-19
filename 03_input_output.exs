defmodule CowInterrogator do
  # Creates docs, can be useful
  
  @doc """
    Gets name from standard IO
  """

  def get_name do
    IO.gets("Whats your name?")
    |> String.trim
  end

  def get_cow_lover do
    IO.getn("Do you like cows? [y|n]")
  end

  def interrogate do
    name = get_name
    case String.downcase(get_cow_lover) do
      "y" -> 
        IO.puts "Great! Heres a cow for you #{name}"
        IO.puts cow_art
      "n" ->
        IO.puts "Thats a shame, #{name}"
    end
  end

  def cow_art do
    path = Path.expand("support/cow.txt", __DIR__)
    case File.read(path) do
      {:ok, art} -> art
      {:error, _} -> IO.puts "Error: No cows found"; System.halt(1)
    end
  end

end

ExUnit.start

defmodule InputOutputTest do
  use ExUnit.Case
  import String

  test "Checks if cow_art returns string from support/cow.txt" do
    art = CowInterrogator.cow_art
    assert trim(art) |> first == "("
  end
end

CowInterrogator.interrogate
