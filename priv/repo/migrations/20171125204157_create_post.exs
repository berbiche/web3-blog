defmodule Blog.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts, primary_key: false) do
      add :title, :string, [primary_key: true]
      add :author, :string, [null: false]
      add :content, :text
      add :date, :naive_datetime, [
        null: false,
        default: fragment("current_timestamp")
      ]

      timestamps()
    end

    # to hopefully provide a searching mechanism?
    create index(:posts, ["(to_tsvector('french', content))"],
                 name: :content_reverse_index, using: :GIN)
  end
end
