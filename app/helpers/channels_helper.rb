module ChannelsHelper
  def self.response(url)
    Nokogiri::XML(URI.open(url)).css('item')
  rescue StandardError
    []
  end
end
