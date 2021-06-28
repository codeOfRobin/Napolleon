defmodule NapolleonWeb.PageController do
  use NapolleonWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
