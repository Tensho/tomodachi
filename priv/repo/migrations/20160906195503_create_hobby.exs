defmodule Tomodachi.Repo.Migrations.CreateHobby do
  use Ecto.Migration

  def change do
    create table(:hobbies) do
      add :title, :string
      add :description, :string
      add :active, :boolean, default: false, null: false
      add :person_id, references(:people, on_delete: :nothing)

      timestamps()
    end
    create unique_index(:hobbies, [:title])
    create index(:hobbies, [:person_id])

  end
end
