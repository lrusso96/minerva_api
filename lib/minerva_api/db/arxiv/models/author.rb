# frozen_string_literal: true

module MinervaApi
  module Arxiv
    # This class represents the author of a paper.
    class Author < MinervaApi::Author
      def initialize(str) #:nodoc:
        l = str.strip.split("\n")
        @full_name = l.shift
        @affiliations = []
        l.each { |af| @affiliations << af.strip }
      end
    end
  end
end
