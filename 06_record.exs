ExUnit.start

defmodule User do
  defstruct email: nil, password: nil
end

defimpl String.Chars, for: User do
  def to_string(%User{email: email}) do
    email
  end
end

defmodule RecordTest do
  use ExUnit.Case

  defmodule ScopeTest do
    use ExUnit.Case

    require Record
    Record.defrecord :person, first_name: nil, last_name: nil, age: nil

    test "defrecordp" do
      p = person(first_name: "Damien", last_name: "Touchette", age: 25)
      assert p == {:person, "Damien", "Touchette", 25}
    end

    def sample do
      %User{ email: "djtouchette@example.com", password: "asdfasdf" }
    end

    test "defstruct" do
      assert sample == %{__struct__: User, email: "djtouchette@example.com", password: "asdfasdf"}
    end

    test "property" do
      assert sample.email === "djtouchette@example.com"
    end

    test "update" do
      u = sample
      u2 = %User{ u | email: "john@example.com"}
      assert u2 === %User{ email: "john@example.com", password: "asdfasdf" }
    end

    test "protocol" do
      assert to_string(sample) == "djtouchette@example.com"
    end
  end
end
