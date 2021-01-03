defmodule UapiWeb.UserView do
  use UapiWeb, :view
  alias UapiWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user, token: token}) do
    %{
      email: user.email,
      token: token
    }
    |> IO.inspect()
  end

  def render("user.json", %{user: user}) do
    %{id: user.id, email: user.email, encrypted_password: user.encrypted_password}
  end
end
