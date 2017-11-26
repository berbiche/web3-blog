defmodule BlogWeb.RootController do
  use BlogWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def apropos(conn, _params) do
    render conn, "apropos.html"
  end
end
