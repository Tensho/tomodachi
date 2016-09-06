defmodule Tomodachi.Repo.Migrations.CreatePerson do
  use Ecto.Migration

  def change do
    create table(:people) do
      add :name, :string
      add :age, :integer

      timestamps()
    end
    create unique_index(:people, [:name])

  end
end
