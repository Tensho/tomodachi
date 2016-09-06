defmodule Tomodachi.HobbyTest do
  use Tomodachi.ModelCase

  alias Tomodachi.Hobby

  @valid_attrs %{active: true, description: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Hobby.changeset(%Hobby{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Hobby.changeset(%Hobby{}, @invalid_attrs)
    refute changeset.valid?
  end
end
