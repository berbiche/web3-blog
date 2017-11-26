defmodule Blog.Post do
    use Ecto.Schema
    import Ecto.Changeset, only: [
        cast: 3,
        validate_required: 2,
        unique_constraint: 2
    ]
    alias Blog.Post

    @primary_key {:title, :string, autogenerate: false}

    schema "posts" do
        field :author, :string
        field :content, :string
        field :date, :naive_datetime
    end

    def changeset(post, params \\ %{}) do
        post
        |> cast(params, [:title, :author, :content])
        |> validate_required([:author])
        |> unique_constraint(:title)
    end
end
