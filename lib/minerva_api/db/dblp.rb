module MinervaApi
  ##
  # This module manages all about the Arxiv DB
  module Dblp
    # useful methods
    extend Common
    # include extended models
    # require_relative './dblp/models/author.rb'
    require_relative './dblp/models/paper.rb'

    def self.esearch(url)
      xml = load_url(url, '//info')
      return unless xml
      papers = []
      xml.each { |x| papers << Dblp::Paper.new(x) }
      papers
    end

    private_class_method :esearch

    # Make a search over Arxiv archive
    #
    # ==== Attributes
    #
    # * +query+ - a string representing the query
    #
    # ==== Examples
    #
    #    papers = Dblp.search 'electron'
    #    papers.size # => 10
    #    papers.first.class # => Dblp::Paper
    def self.search(query)
      url = "http://dblp.org/search/publ/api?q=#{query}"
      esearch url
    end
  end
end
