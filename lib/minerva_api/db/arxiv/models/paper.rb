# frozen_string_literal: true

class String
  def megastrip
    strip.split("\n").map!(&:strip).join ' '
  end
end

module MinervaApi
  module Arxiv
    require 'date'
    require 'nokogiri'

    # This class represents the Arxiv Paper
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
