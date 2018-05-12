module MinervaApi
  module Arxiv
    require 'nokogiri'

    # This class provides useful methods to grep pdf and abstract links
    class Link
      # Link to online abstract of the paper
      attr_accessor :abstract
      # Link to online full paper (pdf format)
      attr_accessor :pdf

      def initialize(xml)#:nodoc:
        @abstract = xml.xpath('.//*[@rel="alternate"]').attribute('href').value
        @pdf = xml.xpath('.//*[@rel="related" and @title="pdf"]')
                  .attribute('href').value
      end
    end
  end
end
