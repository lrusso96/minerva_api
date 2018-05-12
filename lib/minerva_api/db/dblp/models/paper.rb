module MinervaApi
  module Dblp
    require 'nokogiri'

    # This class represents the Dblp Paper and extends MinervaApi::Paper
    class Paper < MinervaApi::Paper
      def initialize(xml) #:nodoc:
        @title = xml.xpath('title').text
        @authors = []
        xml.xpath('.//author').each { |a| @authors << Author.new(a.text) }
        @link = Link.new xml
      end
    end
  end
end
