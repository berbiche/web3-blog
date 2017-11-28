defmodule BlogWeb.PostController do
  use BlogWeb, :controller
  alias Blog.{Repo, Post}

  def index(conn, _params) do
    posts = Post
      |> select([:author, :title, :date])
      |> Repo.all()

    render conn, "index.html", posts: posts
  end

  def show(conn, %{"name" => name}) do
    post = Post.get!(name)
    render conn, "show.html", post: post
  end

  def new(conn, _params) do
    changeset = Post.change(%Post{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"post" => post_params}) do
    case Post.create(post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post created successfully.")
        |> redirect(to: post_path(conn, :show, post))
      {:error, %Ecto.Changeset{} = changeset} ->
        render conn, "new.html", changeset: changeset
    end
  end

  def edit(conn, %{"name" => name}) do
    post = Post.get!(name)
    changeset = Post.change(post)
    render conn, "edit.html", post: post, changeset: changeset
  end

  def update(conn, %{"name" => name, "post" => post_params}) do
    post = Post.get!(name)

    case Post.update(post, post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post updated successfully.")
        |> redirect(to: post_path(conn, :show, post))
      {:error, %Ecto.Changeset{} = changeset} ->
        render conn, "edit.html", post: post, changeset: changeset
    end
  end

  def delete(conn, %{"name" => name}) do
    post = Post.get!(name)
    {:ok, _post} = Post.delete(post)

    conn
    |> put_flash(:info, "Post deleted successfully.")
    |> redirect(to: post_path(conn, :index))
  end
end
