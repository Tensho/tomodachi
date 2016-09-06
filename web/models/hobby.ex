defmodule Tomodachi.Hobby do
  use Tomodachi.Web, :model

  schema "hobbies" do
    field :title, :string
    field :description, :string
    field :active, :boolean, default: false
    belongs_to :person, Tomodachi.Person

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description, :active])
    |> validate_required([:title, :description, :active])
    |> unique_constraint(:title)
  end
end
