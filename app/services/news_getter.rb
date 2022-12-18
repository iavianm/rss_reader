class NewsGetter
  class << self
    def call(url:, id:)
      new(url, id).call
    end
  end

  begin
    def call
      response = response(url)

      if check_last_news(channel_id).nil?
        response.each do |item|
          News.create(
            title: item.css('title').children.text,
            link: item.css('link').children.text,
            description: item.css('description').children.text,
            image_url: item.css("enclosure").first.nil? ? nil : item.css("enclosure").first.attributes['url'].value,
            author: item.css('author').children.text,
            pubdate: item.css('pubDate').children.text.to_datetime.to_i,
            channel_id: channel_id,
          )
        end
      else
        response.each do |item|
          if check_last_news(channel_id).pubdate < item.css('pubDate').children.text.to_datetime.to_i
            News.create(
              title: item.css('title').children.text,
              link: item.css('link').children.text,
              description: item.css('description').children.text,
              image_url: item.css("enclosure").first.nil? ? nil : item.css("enclosure").first.attributes['url'].value,
              author: item.css('author').children.text,
              pubdate: item.css('pubDate').children.text.to_datetime.to_i,
              channel_id: channel_id,
            )
          end
        end
        News.last.delete
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

  def check_last_news(channel_id)
    channel = Channel.find(channel_id)
    channel_news = channel.news
    !channel_news.empty? ? channel_news.last : nil
  end

  def response(url)
    Nokogiri::XML(URI.open(url)).css('item')
  end
end
