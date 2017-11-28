defmodule Blog.BlogWebTest do
  use Blog.DataCase

  alias Blog.BlogWeb

  describe "post" do
    alias Blog.BlogWeb.Post

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> BlogWeb.create_post()

      post
    end

    test "list_post/0 returns all post" do
      post = post_fixture()
      assert BlogWeb.list_post() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert BlogWeb.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      assert {:ok, %Post{} = post} = BlogWeb.create_post(@valid_attrs)
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = BlogWeb.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      assert {:ok, post} = BlogWeb.update_post(post, @update_attrs)
      assert %Post{} = post
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = BlogWeb.update_post(post, @invalid_attrs)
      assert post == BlogWeb.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = BlogWeb.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> BlogWeb.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = BlogWeb.change_post(post)
    end
  end
end
