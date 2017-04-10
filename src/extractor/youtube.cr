require "json"

class Youtube
  VALID_URL = /^((?:https?:\/\/|\/\/)(?:(?:(?:(?:www\.)?youtube\.com\/)(?:(?:(?:v|embed|e)\/(?!videoseries))|(?:(?:(?:watch|movie)\/?)?(?:\?)v=)))|(?:youtu\.be)\/))?(?<video_id>[0-9A-Za-z_-]{11})/

  # url = "https://www.youtube.com/watch?v=iDfZua4IS4A"
  # _real_extract(url)
  def _real_extract(url)
    proto = "https"
    video_id = extract_id(url)
    url = "%s://www.youtube.com/watch?v=%s&gl=US&hl=en&has_verified=1&bpctr=9999999999" % [proto, video_id]
  end

  def self.extract_id(url)
    video_id = VALID_URL.match(url).try(&.["video_id"]).to_s
    raise "Invalid URL: #{url}" if video_id.empty?
    video_id
  end
end