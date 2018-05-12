module MinervaApi
  ##
  # This module manages all about the Arxiv DB
  module Arxiv
    # useful methods
    extend Common
    # include extended models
    require_relative './arxiv/models/author.rb'
    require_relative './arxiv/models/paper.rb'
    require_relative './arxiv/models/link.rb'

    def self.esearch(url, unique = false)
      xml = load_url(url, '//entry', true)
      return unless xml
      return Arxiv::Paper.new(xml) if unique
      papers = []
      xml.each { |x| papers << Arxiv::Paper.new(x) }
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
    #    papers = Arxiv.search 'electron'
    #    papers.size # => 10
    #    papers.first.class # => Arxiv::Paper
    def self.search(query)
      url = "http://export.arxiv.org/api/query?search_query=all:#{query}"
      esearch url
    end

    # Get Paper infos
    #
    # ==== Attributes
    #
    # * +id+ - the Arxiv identifier for manuscripts
    #
    # ==== Examples
    #
    #    paper = Arxiv.get '1202.0819'
    #    paper.class # => Arxiv::Paper
    def self.get(id)
      url = "http://export.arxiv.org/api/query?id_list=#{id}"
      esearch url, true
    end
  end
end
