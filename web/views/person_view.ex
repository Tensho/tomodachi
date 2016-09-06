defmodule Tomodachi.PersonView do
  use Tomodachi.Web, :view

  def render("index.json", %{people: people}) do
    %{data: render_many(people, Tomodachi.PersonView, "person.json")}
  end

  def render("show.json", %{person: person}) do
    %{data: render_one(person, Tomodachi.PersonView, "person.json")}
  end

  def render("person.json", %{person: person}) do
    %{id: person.id,
      name: person.name,
      age: person.age}
  end
end
