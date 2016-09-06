defmodule Tomodachi.Router do
  use Tomodachi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Tomodachi do
    pipe_through :api

    resources "/people", PersonController, except: [:new, :edit]
    resources "/hobbies", HobbyController, except: [:new, :edit]
  end
end
