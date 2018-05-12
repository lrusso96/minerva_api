module MinervaApi
  ##
  # This represents the paper (manusript)
  class Paper
    # The title of paper
    attr_accessor :title
    # Summary / abstract is a brief description of the paper
    attr_accessor :summary
    # Array of all authors and co-authors of the paper
    attr_accessor :authors
    # This provides links to online version of the paper
    attr_accessor :link
  end
end
