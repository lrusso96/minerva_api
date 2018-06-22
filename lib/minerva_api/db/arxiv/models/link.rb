module MinervaApi
  module Arxiv
    require 'nokogiri'

    # This class provides useful methods to grep pdf and abstract links
    class Link < MinervaApi::Link
      def initialize(xml) #:nodoc:
        @summary = xml.xpath('.//*[@rel="alternate"]').attribute('href').value
        @full = xml.xpath('.//*[@rel="related" and @title="pdf"]')
                   .attribute('href').value
      end
    end
  end
end
