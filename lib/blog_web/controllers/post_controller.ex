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
        |> put_success_flash(gettext "Post created successfully.")
        |> redirect(to: post_path(conn, :show, post))
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_error_flash(gettext "Post could not be created, fix all errors.")
        |> render("new.html", changeset: changeset)
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
        |> put_success_flash(gettext("Post updated successfully."))
        |> redirect(to: post_path(conn, :show, post))
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_error_flash(gettext("Post could not be updated, fix all errors."))
        |> render("edit.html", post: post, changeset: changeset)
    end
  end

  def delete(conn, %{"name" => name}) do
    post = Post.get!(name)
    case Post.delete(post) do
      {:ok, _} ->
        conn
        |> put_success_flash(gettext "Post deleted successfully.")
        |> redirect(to: post_path(conn, :index))
      {:error, _} ->
        conn
        |> put_error_flash(gettext "Post could not be deleted, try again.")
        |> redirect(to: post_path(conn, :index))
    end
  end

  defp put_error_flash(conn, message) do
    conn
    |> put_flash(:status, :error)
    |> put_flash(:message, message)
  end

  defp put_success_flash(conn, message) do
    conn
    |> put_flash(:status, :ok)
    |> put_flash(:message, message)
  end
end
