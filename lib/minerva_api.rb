##
# == Description
#
# This module wraps useful methods to make search over the most important Open
# Access Databases.
#
# == Supported DB
#
# * Arxiv
# * Dblp
module MinervaApi
  # Useful stuff
  require 'minerva_api/version'
  require 'minerva_api/common'
  # Models
  require 'minerva_api/models/author'
  require 'minerva_api/models/paper'
  require 'minerva_api/models/link'
  # DB access
  require 'minerva_api/db/arxiv'
  require 'minerva_api/db/dblp'
end
