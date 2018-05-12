module MinervaApi
  module Common #:nodoc:
    require 'net/http'
    require 'nokogiri'

    private

    def load_url(url, path = '//info', rm_ns = false)
      begin
      uri = URI.parse(url)
      response = Net::HTTP.get_response(uri)
      return nil unless response.code_type.to_s == 'Net::HTTPOK'
    rescue Exception
      p 'Failed due to NETError'
      return nil
    end
      doc = Nokogiri::XML(response.body)
      doc.remove_namespaces! if rm_ns
      doc.xpath(path)
    end
  end
end
