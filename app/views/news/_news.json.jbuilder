json.extract!(news, :id, :title, :link, :author, :description, :pubDate, :created_at, :updated_at)
json.url(news_url(news, format: :json))
