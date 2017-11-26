# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Blog.Repo.insert!(%Blog.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
Blog.Repo.insert!(%Blog.Post{
    title: "Premier blog écrit sur ce site",
    author: "Nicolas Berbiche",
    content: "<h1>Le blog est fonctionnel!</h1>"
})
Blog.Repo.insert!(%Blog.Post{
    title: "Deuxième blog écrit sur ce site",
    author: "Nicolas Berbiche",
    content: "<h1>2e article</h1>"
})
Blog.Repo.insert!(%Blog.Post{
    title: "Troisième blog écrit sur ce site",
    author: "Nicolas Berbiche",
    content: "<h1>3e article</h1>"
})
Blog.Repo.insert!(%Blog.Post{
    title: "Quatrième blog écrit sur ce site",
    author: "Nicolas Berbiche",
    content: "<h1>4e article</h1>"
})
Blog.Repo.insert!(%Blog.Post{
    title: "Cinquième blog écrit sur ce site",
    author: "Nicolas Berbiche",
    content: "<h1>5e article</h1>"
})

