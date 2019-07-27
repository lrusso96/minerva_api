# frozen_string_literal: true

module MinervaApi
  module Common
    require 'net/http'
    require 'nokogiri'

    private

    def load_url(url, path, rm_ns = false)
      begin
        response = Net::HTTP.get_response(URI.parse(url))
        return nil unless response.code_type.to_s == 'Net::HTTPOK'
      rescue StandardError
        p 'Failed due to NETError'
        return nil
      end
      doc = Nokogiri::XML(response.body)
      doc.remove_namespaces! if rm_ns
      doc.xpath path
    end
  end
end
