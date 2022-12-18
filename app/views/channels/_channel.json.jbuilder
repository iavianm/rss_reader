json.extract!(channel, :id, :title, :string, :url, :string, :created_at, :updated_at)
json.url(channel_url(channel, format: :json))
