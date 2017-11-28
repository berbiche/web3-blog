defmodule Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset, only: [
    cast: 3,
    validate_required: 2,
    unique_constraint: 2
  ]
  alias Blog.{Repo,Post}

  @derive {Phoenix.Param, key: :title}
  @primary_key {:title, :string, autogenerate: false}
  schema "posts" do
    field :author, :string
    field :content, :string
    field :date, :naive_datetime

    timestamps()
  end

  def changeset(%Post{} = post, params \\ %{}) do
    post
    |> cast(params, [:title, :author, :content])
    |> validate_required([:author])
    |> unique_constraint(:title)
  end

  def get!(id), do: Repo.get!(Post, id)

  def create(attrs \\ %{}) do
    %Post{}
    |> changeset(attrs)
    |> Repo.insert()
  end

  def update(%Post{} = post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
  end

  def delete(%Post{} = post) do
    Repo.delete(post)
  end

  def change(%Post{} = post) do
    Post.changeset(post, %{})
  end
end
