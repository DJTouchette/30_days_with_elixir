ExUnit.start

defmodule MyTest do
  use ExUnit.Case

  test "simple test" do
    assert 1 + 1 == 2
  end

  test "refute is opposite of assert" do
    refute 1 + 1 === 3
  end

  test :asser_raise do
    assert_raise ArithmeticError, fn -> 
      1 + "x"
    end
  end

  test "assert_in_delta asserts that val1 and val2 differ bt less than delta" do
    assert_in_delta 1, # actual
                    5, # expectes
                    6  # delta
  end
end
