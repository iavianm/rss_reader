class NewsGetter
  class << self
    def call(url:, id:)
      new(url, id).call
    end
  end

  begin
    def call
      response ||= response(url)

      last_news_date ||= check_last_news(channel_id)

      if last_news_date.nil?
        response.each do |item|
          create_news(item)
        end
      else
        response.each do |item|
          if last_news_date.pubdate < item.css('pubDate').children.text.to_datetime.to_i
            create_news(item)
          end
        end
        # News.last.delete
      end
    end
  rescue TypeError => e
    e.class
  rescue SocketError => e
    e.class
  rescue Errno::ENOENT => e
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
    !channel_news.empty? ? channel_news.order(pubdate: :desc).first : nil
  end

  def response(url)
    Nokogiri::XML(URI.open(url)).css('item')
  rescue Exception
    []
  end

  def create_news(item)
    news = News.new(
      title: item.css('title').text,
      link: item.css('link').text,
      description: item.css('description').text,
      image_url: item.css('enclosure').first.nil? ? nil : item.css('enclosure').first.attributes['url'].value,
      author: item.css('author').text,
      pubdate: item.css('pubDate').text.to_datetime.to_i,
      channel_id: channel_id,
    )
    news.save
  end
end
