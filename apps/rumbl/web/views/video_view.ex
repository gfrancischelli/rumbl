defmodule Rumbl.VideoView do
  use Rumbl.Web, :view

  def video_thumbnail(%Rumbl.Video{url: url}) do
    # "https://www.youtube.com/watch?v=" <> youtube_id = url
    # "https://img.youtube.com/vi/" <> youtube_id <> "/mqdefault.jpg"
    case url do
      "https://www.youtube.com/watch?v=" <> youtube_id ->
        "https://img.youtube.com/vi/" <> youtube_id <> "/mqdefault.jpg"
      _ ->
        ""
    end
  end

  def render_desc(%Rumbl.Video{description: desc}) do
    if String.length(desc) > 140 do
      String.slice(desc, 0..140) <> "..."
    else
      desc
    end
  end
end
