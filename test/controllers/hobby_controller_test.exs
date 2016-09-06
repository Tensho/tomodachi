defmodule Tomodachi.HobbyControllerTest do
  use Tomodachi.ConnCase

  alias Tomodachi.Hobby
  @valid_attrs %{active: true, description: "some content", title: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, hobby_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    hobby = Repo.insert! %Hobby{}
    conn = get conn, hobby_path(conn, :show, hobby)
    assert json_response(conn, 200)["data"] == %{"id" => hobby.id,
      "title" => hobby.title,
      "description" => hobby.description,
      "active" => hobby.active,
      "person_id" => hobby.person_id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, hobby_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, hobby_path(conn, :create), hobby: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Hobby, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, hobby_path(conn, :create), hobby: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    hobby = Repo.insert! %Hobby{}
    conn = put conn, hobby_path(conn, :update, hobby), hobby: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Hobby, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    hobby = Repo.insert! %Hobby{}
    conn = put conn, hobby_path(conn, :update, hobby), hobby: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    hobby = Repo.insert! %Hobby{}
    conn = delete conn, hobby_path(conn, :delete, hobby)
    assert response(conn, 204)
    refute Repo.get(Hobby, hobby.id)
  end
end
