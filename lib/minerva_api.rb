##
# == Description
#
# This module wraps useful methods to make search over the most important Open
# Access Databases.
#
# == Supported DB
#
# * Arxiv
module MinervaApi
  # Useful stuff
  require 'minerva_api/version'
  require 'minerva_api/common'
  # Models
  require 'minerva_api/models/author'
  require 'minerva_api/models/paper'
  # DB access
  require 'minerva_api/db/Arxiv'
end
