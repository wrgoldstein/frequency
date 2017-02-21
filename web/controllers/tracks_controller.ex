defmodule Frequency.TracksController do
  use Frequency.Web, :controller

  def index(conn, params) do
    {:ok, message} = Poison.encode(params)
    Frequency.Worker.publish(message)
    conn
     |> text("200")
  end
end
