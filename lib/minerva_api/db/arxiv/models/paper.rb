module MinervaApi
  module Arxiv
    require 'nokogiri'

    # This class represents the Arxiv Paper and extends MinervaApi::Paper
    class Paper < MinervaApi::Paper
      def initialize(xml)#:nodoc:
        @title = xml.xpath('title').text
        @summary = xml.xpath('summary').text.strip
        @authors = []
        xml.xpath('.//author').each { |a| @authors << Author.new(a.text) }
        @link = Link.new xml
      end
    end
  end
end
