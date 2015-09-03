require "./model/base"
require "./model/adapters"
require "./model/associations"
require "./model/queries"

module Jet::Model
  PERMITTED_ADAPTERS = ["mysql", "postgresql"]
end
