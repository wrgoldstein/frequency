defmodule Frequency.Router do
  use Frequency.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Frequency do
    pipe_through :api

    post "/t", TracksController, :index
  end
end
