defmodule Tomodachi.HobbyView do
  use Tomodachi.Web, :view

  def render("index.json", %{hobbies: hobbies}) do
    %{data: render_many(hobbies, Tomodachi.HobbyView, "hobby.json")}
  end

  def render("show.json", %{hobby: hobby}) do
    %{data: render_one(hobby, Tomodachi.HobbyView, "hobby.json")}
  end

  def render("hobby.json", %{hobby: hobby}) do
    %{id: hobby.id,
      title: hobby.title,
      description: hobby.description,
      active: hobby.active,
      person_id: hobby.person_id}
  end
end
