# frozen_string_literal: true

module MinervaApi
  # This represents the author of a manuscript
  class Author
    require 'full-name-splitter'
    # Institute, university, etc. of the author
    attr_accessor :affiliations
    # Full name of the author
    attr_accessor :full_name

    # get the first name of the author
    #
    #   author.full_name  # => "Albert A. Einstein"
    #   author.first_name  # => "Albert A."
    def first_name
      FullNameSplitter.split(full_name).first
    end

    # get the last name of the author
    #
    #   author.full_name  # => "Albert A. Einstein"
    #   author.last_name  # => "Einstein"
    def last_name
      FullNameSplitter.split(full_name).last
    end
  end
end
