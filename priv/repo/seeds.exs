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
    content: """
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eleifend, urna vel ultricies interdum, velit lectus gravida mauris, et iaculis arcu enim ac lacus. Etiam eleifend mauris sed mi molestie, luctus mattis mi fringilla. Donec lobortis ex commodo, sollicitudin urna in, malesuada nibh. Praesent a vestibulum mauris. Aliquam erat volutpat. Duis vel nulla sed neque sagittis tincidunt vel at dolor. Duis tincidunt neque arcu, non consectetur felis commodo eu. Vestibulum a sem sodales, egestas nulla a, eleifend libero. Vivamus a placerat massa. Pellentesque nec nibh sed nulla rutrum gravida. Donec commodo, lorem sodales blandit scelerisque, lectus ex fermentum felis, quis fringilla magna augue vitae metus. Nunc luctus nibh ac ex venenatis rhoncus.</p>

    <p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nullam pulvinar feugiat justo, quis faucibus erat tincidunt vitae. Vivamus vitae leo pretium, iaculis eros non, dictum ipsum. Aliquam quis enim sed purus gravida cursus mollis in risus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Cras mi justo, consectetur vel mi sit amet, luctus congue tellus. Mauris et lorem id nisi volutpat varius ac at urna. Nullam elementum erat vitae ante vehicula, sit amet rutrum arcu laoreet. Sed pharetra libero quis dolor eleifend laoreet. Praesent ornare ultrices quam in efficitur. Phasellus in quam sit amet orci tincidunt porta. Nam eget iaculis arcu, ut auctor mauris. Pellentesque ac magna vel mauris pulvinar posuere ac sit amet ante. Duis bibendum turpis ac ante volutpat blandit. Aenean non dui ac massa blandit cursus vitae a augue. Nulla non tristique lacus.</p>

    <p>Nunc dolor nunc, semper vel rutrum quis, consequat quis orci. Nullam varius nunc odio, a ornare sem cursus sed. Etiam gravida efficitur ultricies. Pellentesque ex nunc, aliquam ac eros sit amet, sodales hendrerit diam. Maecenas vel volutpat ligula. Donec euismod, massa ut dictum tristique, tellus mi eleifend lectus, vitae volutpat nunc augue vitae elit. Nullam quis blandit massa. Mauris rutrum aliquam neque non malesuada. Nunc feugiat mauris et tempor fringilla. Duis finibus a nulla vitae sollicitudin. Sed id dapibus mauris, non eleifend nisi. Quisque semper lacus non erat tincidunt elementum. Suspendisse sed dictum eros, vel imperdiet urna. Maecenas ut auctor enim.</p>

    <p>Praesent vitae erat vel odio bibendum sodales. Phasellus sit amet orci nec nibh cursus condimentum. Duis malesuada convallis tortor eu placerat. Nunc tristique justo ut velit fermentum, vel rhoncus massa auctor. Curabitur arcu velit, volutpat at ipsum sit amet, cursus elementum lectus. Etiam sed tristique ante, consectetur mollis ex. Vivamus luctus viverra vestibulum. Aenean metus arcu, hendrerit ac condimentum at, ullamcorper sed leo.</p>

    <p>In ultrices nunc eu diam ultricies lobortis. Duis ut augue mattis, consequat mauris interdum, malesuada enim. Fusce congue, felis vitae accumsan commodo, diam turpis ultricies libero, in ultricies magna nulla consectetur velit. Proin laoreet purus commodo, molestie augue at, efficitur felis. Aliquam vitae nunc at risus malesuada malesuada quis eu arcu. Vivamus ut odio urna. Donec pulvinar justo quis felis ultrices bibendum.</p>
    """
})
Blog.Repo.insert!(%Blog.Post{
    title: "Deuxième blog écrit sur ce site",
    author: "Nicolas Berbiche",
    content: "<p>2e article</p>"
})
Blog.Repo.insert!(%Blog.Post{
    title: "Troisième blog écrit sur ce site",
    author: "Nicolas Berbiche",
    content: "<p>3e article</p>"
})
Blog.Repo.insert!(%Blog.Post{
    title: "Quatrième blog écrit sur ce site",
    author: "Nicolas Berbiche",
    content: "<p>4e article</p>"
})
Blog.Repo.insert!(%Blog.Post{
    title: "Cinquième blog écrit sur ce site",
    author: "Nicolas Berbiche",
    content: "<p>5e article</p>"
})

