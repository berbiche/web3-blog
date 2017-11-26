defmodule BlogWeb.LayoutView do
  use BlogWeb, :view

  def nav_item(assigns) do
    render "nav_item.html", assigns
  end
end
