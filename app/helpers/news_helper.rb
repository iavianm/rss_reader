module NewsHelper
  def get_news
    channels = Channel.all
    channels.each do |channel|
      NewsGetter.(url: channel.url, id: channel.id)
    end
  end
end
