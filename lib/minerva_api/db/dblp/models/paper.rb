# frozen_string_literal: true

module MinervaApi
  module Dblp
    require 'nokogiri'

    # This class represents the Dblp Paper.
    class Paper < MinervaApi::Paper
      def initialize(xml)
        @title = xml.xpath('title').text
        @authors = []
        xml.xpath('.//author').each { |a| @authors << Author.new(a.text) }
        @link = Link.new xml
      end
    end
  end
end
