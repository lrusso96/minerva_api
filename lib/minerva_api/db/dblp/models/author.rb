module MinervaApi
  module Dblp
    ##
    # This class represents the author of a paper. It extends the superclass
    # MinervaApi::Author
    class Author < MinervaApi::Author
      def initialize(str) #:nodoc:
        @full_name = str.strip
      end
    end
  end
end
