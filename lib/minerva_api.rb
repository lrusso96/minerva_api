# frozen_string_literal: true

# This module wraps useful methods to make search over the most important Open
# Access Databases, like Arxiv and Dblp
module MinervaApi
  require 'minerva_api/version'
  require 'minerva_api/common'

  require 'minerva_api/models/author'
  require 'minerva_api/models/paper'
  require 'minerva_api/models/link'

  require 'minerva_api/db/arxiv'
  require 'minerva_api/db/dblp'
end
