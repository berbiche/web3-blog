defmodule BlogWeb.PostControllerTest do
  use BlogWeb.ConnCase

  alias Blog.Post

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:post) do
    {:ok, post} = Post.create(@create_attrs)
    post
  end

  describe "index" do
    test "lists all post", %{conn: conn} do
      conn = get conn, post_path(conn, :index)
      assert String.length(html_response(conn, 200)) > 0
    end
  end

  describe "new post" do
    test "renders form", %{conn: conn} do
      conn = get conn, post_path(conn, :new)
      assert html_response(conn, 200) =~ "New Post"
    end
  end

  describe "create post" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, post_path(conn, :create), post: @create_attrs

      assert %{name: name} = redirected_params(conn)
      assert redirected_to(conn) == post_path(conn, :show, name)

      conn = get conn, post_path(conn, :show, name)
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, post_path(conn, :create), post: @invalid_attrs
      assert html_response(conn, 200)
    end
  end

  describe "edit post" do
    setup [:create_post]

    test "renders form for editing chosen post", %{conn: conn, post: post} do
      conn = get conn, post_path(conn, :edit, post)
      assert String.length(html_response(conn, 200)) > 0
    end
  end

  describe "update post" do
    setup [:create_post]

    test "redirects when data is valid", %{conn: conn, post: post} do
      conn = put conn, post_path(conn, :update, post), post: @update_attrs
      assert redirected_to(conn) == post_path(conn, :show, post)

      conn = get conn, post_path(conn, :show, post)
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, post: post} do
      conn = put conn, post_path(conn, :update, post), post: @invalid_attrs
      assert html_response(conn, 200)
    end
  end

  describe "delete post" do
    setup [:create_post]

    test "deletes chosen post", %{conn: conn, post: post} do
      conn = delete conn, post_path(conn, :delete, post)
      assert redirected_to(conn) == post_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, post_path(conn, :show, post)
      end
    end
  end

  defp create_post(_) do
    post = fixture(:post)
    {:ok, post: post}
  end
end
