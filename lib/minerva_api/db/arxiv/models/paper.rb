class String #:nodoc:
  def megastrip #:nodoc:
    strip.split("\n").map!(&:strip).join ' '
  end
end

module MinervaApi
  module Arxiv
    require 'Date'
    require 'nokogiri'
    # This class represents the Arxiv Paper and extends MinervaApi::Paper
    class Paper < MinervaApi::Paper
      def initialize(xml) #:nodoc:
        @title = xml.xpath('title').text.megastrip
        @summary = xml.xpath('summary').text.megastrip
        @authors = []
        xml.xpath('.//author').each { |a| @authors << Author.new(a.text) }
        @link = Link.new xml
        @published_date = Date.parse(xml.xpath('published').text)
      end
    end
  end
end
