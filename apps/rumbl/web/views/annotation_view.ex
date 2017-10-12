defmodule Rumbl.AnnotationView do
  use Rumbl.Web, :view

  def render("annotation.json", %{annotation: ann}) do
    %{
      at: ann.at,
      id: ann.id,
      body: ann.body,
      user: render_one(ann.user, Rumbl.UserView, "user.json")
    }
  end
end
