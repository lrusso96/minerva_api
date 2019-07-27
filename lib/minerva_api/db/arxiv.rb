# frozen_string_literal: true

module MinervaApi
  # This module manages all about the Arxiv DB
  module Arxiv
    API_URL = 'http://export.arxiv.org/api/query?'
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

    def self.join_words(words)
      l = words.split(' ')
      return words if l.size == 1

      s = '%22'
      l.each { |w| s += w + '+' }
      s.chomp '+'
      s += '%22'
      s
    end
    private_class_method :join_words

    def self.hash_to_query(hash)
      c = '+AND+'
      s = ''
      s += "all:#{join_words(hash[:all])}" + c if hash.key?(:all)
      s += "au:#{join_words(hash[:author])}" + c if hash.key?(:author)
      s += "ti:#{join_words(hash[:title])}" + c if hash.key?(:title)
      s += "abs:#{join_words(hash[:abstract])}" + c if hash.key?(:abstract)
      s += "cat:#{join_words(hash[:category])}" + c if hash.key?(:category)
      s.chomp c
    end
    private_class_method :hash_to_query

    def self.build_query(words)
      s = API_URL + 'search_query='
      case words
      when String # fix?
        return s + 'all:' + words
      when Array
        return s + 'all:' + words.join('+')
      when Hash
        return s + hash_to_query(words)
      else
        return
      end
    end

    private_class_method :build_query

    # Make a search over Arxiv archive
    #
    # @param [String] words
    # @param [Array] words
    #
    #    papers = Arxiv.search 'electron'
    #    papers = Arxiv.search ['electron', 'matter']
    #    h = {}; h[author]="Einstein"; papers = Arxiv.search h
    def self.search(words)
      q = build_query words
      p q
      esearch q
    end

    # Get Paper infos
    #
    # @param [String] id: Arxiv identifier
    #
    #    paper = Arxiv.get '1202.0819'
    #    paper.class # => Arxiv::Paper
    def self.get(id)
      url = API_URL + "id_list=#{id}"
      esearch url, true
    end
  end
end
