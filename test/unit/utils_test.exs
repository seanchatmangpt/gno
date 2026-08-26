defmodule Gno.UtilsTest do
  use ExUnit.Case

  doctest Gno.Utils

  describe "clean_ansi/2" do
    test "leaves iodata untouched when ansi is disabled" do
      assert Gno.Utils.clean_ansi(["hi"], false) == ["hi"]
      assert Gno.Utils.clean_ansi([], false) == []
    end

    test "prepends an ANSI reset when ansi is enabled" do
      assert Gno.Utils.clean_ansi(["hi"], true) == [IO.ANSI.reset(), "hi"]
      assert Gno.Utils.clean_ansi(["a", "b"], true) == [IO.ANSI.reset(), "a", "b"]
    end
  end

  describe "terminal_width/0" do
    test "returns a real integer from the actual terminal environment" do
      # No mocking of :io.columns/0 -- this exercises whichever real branch
      # (a real column count, or the documented fallback) the current
      # environment actually takes.
      assert is_integer(Gno.Utils.terminal_width())
    end

    test "falls back to 120 when :io.columns/0 reports no terminal" do
      # ExUnit's own test runner has no real terminal columns, so this
      # exercises the real fallback branch, not a mocked one.
      assert :io.columns() == {:error, :enotsup}
      assert Gno.Utils.terminal_width() == 120
    end
  end
end
