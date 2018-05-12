module MinervaApi
  module Dblp
    require 'nokogiri'

    # This class provides useful methods to grep pdf and abstract links
    class Link
      def initialize(xml) #:nodoc:
        @full = xml.xpath('ee').text
      end
    end
  end
end
