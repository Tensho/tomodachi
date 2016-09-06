defmodule Tomodachi.HobbyController do
  use Tomodachi.Web, :controller

  alias Tomodachi.Hobby

  def index(conn, _params) do
    hobbies = Repo.all(Hobby)
    render(conn, "index.json", hobbies: hobbies)
  end

  def create(conn, %{"hobby" => hobby_params}) do
    changeset = Hobby.changeset(%Hobby{}, hobby_params)

    case Repo.insert(changeset) do
      {:ok, hobby} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", hobby_path(conn, :show, hobby))
        |> render("show.json", hobby: hobby)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tomodachi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    hobby = Repo.get!(Hobby, id)
    render(conn, "show.json", hobby: hobby)
  end

  def update(conn, %{"id" => id, "hobby" => hobby_params}) do
    hobby = Repo.get!(Hobby, id)
    changeset = Hobby.changeset(hobby, hobby_params)

    case Repo.update(changeset) do
      {:ok, hobby} ->
        render(conn, "show.json", hobby: hobby)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tomodachi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    hobby = Repo.get!(Hobby, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(hobby)

    send_resp(conn, :no_content, "")
  end
end
