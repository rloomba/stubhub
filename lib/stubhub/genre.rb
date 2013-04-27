module Stubhub
  class Genre < Document
    def self.search(search_query, options = {})
      params = { :description => search_query }
      find(params, options)
    end

  end
end