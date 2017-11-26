defmodule BlogWeb.PostController do
  use BlogWeb, :controller
  alias Blog.{Repo, Post}

  def index(conn, _params) do
    posts = Post
      |> select([:author, :title, :date])
      |> Repo.all()

    render conn, "index.html", posts: posts
  end
end
