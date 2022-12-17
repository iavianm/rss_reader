class NewsGetter
  class << self
    def call(url:, id:)
      new(url, id).call
    end
  end

  begin
    def call
      response ||= Nokogiri::XML(URI.open(url)).css('item')
      response.each do |item|
        News.create(
          title: item.css('title').children.text,
          link: item.css('link').children.text,
          description: item.css('description').children.text,
          author: item.css('author').children.text,
          pubdate: item.css('pubDate').children.text,
          channel_id: channel_id,
        )
      end
    end
  rescue TypeError => e
    e.class
  rescue SocketError => e
    e.class
  end

  private

  attr_reader :url, :channel_id

  def initialize(url, id)
    @url = url
    @channel_id = id
  end
end
