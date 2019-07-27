# frozen_string_literal: true

module MinervaApi
  # This represents the paper (manuscript)
  class Paper
    # The title of paper
    attr_reader :title
    # Summary / abstract is a brief description of the paper
    attr_reader :summary
    # Array of all authors and co-authors of the paper
    attr_reader :authors
    # This provides links to online version of the paper
    attr_reader :link
    # The date of publication
    attr_reader :published_date

    # @@return a formatted date
    #   paper.published # => 'May 13, 2018'
    def published
      published_date&.strftime('%B %d, %Y')
    end
  end
end
