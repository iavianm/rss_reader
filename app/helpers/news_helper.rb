module NewsHelper
  def get_news(channels)
    channels.each do |channel|
      NewsGetter.(url: channel.url, id: channel.id)
    end
  end
end
