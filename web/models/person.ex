defmodule Tomodachi.Person do
  use Tomodachi.Web, :model

  schema "people" do
    field :name, :string
    field :age, :integer
    has_many :hobbies, Tomodachi.Hobby

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :age])
    |> validate_required([:name, :age])
    |> unique_constraint(:name)
  end
end
