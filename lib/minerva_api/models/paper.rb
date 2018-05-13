module MinervaApi
  ##
  # This represents the paper (manusript)
  class Paper
    # The title of paper
    attr_reader :title
    # Summary / abstract is a brief description of the paper
    attr_reader :summary
    # Array of all authors and co-authors of the paper
    attr_reader :authors
    # This provides links to online version of the paper
    attr_reader :link
    # The date of pubblication
    attr_reader :published_date

    ##
    # returns a formatted date
    #   paper.published # => 'May 13, 2018'
    def published
      published_date.strftime('%B %d, %Y') unless published_date.nil?
    end
  end
end
