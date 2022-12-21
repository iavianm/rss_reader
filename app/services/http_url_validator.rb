class HttpUrlValidator < ActiveModel::EachValidator
  def self.compliant?(value)
    uri = URI.parse(value)
    uri.is_a?(URI::HTTP) && !uri.host.nil? && Net::HTTP.get_response(uri) != '200'
  rescue URI::InvalidURIError
  rescue SocketError
  rescue StandardError
    false
  end

  def validate_each(record, attribute, value)
    if value.present? && self.class.compliant?(value)
      xml = ParseXml.response(value)
      if xml.length.zero?
        record.errors.add(attribute, 'There is no news on this channel')
      end
    else
      record.errors.add(attribute, 'is not a valid HTTP URL')
    end
  end
end
