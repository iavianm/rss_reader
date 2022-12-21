module ChannelsHelper
  def something_url(url)
    uri = URI(url)
    res = Net::HTTP.get_response(uri)
    xml = ChannelsHelper.response(url)

    if res.code == '200'
      url
    elsif res.code != '404' && xml.length.zero?
      'no news channels found'
    else
      'the link is not valid'
    end
  end

  def self.response(url)
    Nokogiri::XML(URI.open(url)).css('item')
  rescue Exception
    []
  end
end
