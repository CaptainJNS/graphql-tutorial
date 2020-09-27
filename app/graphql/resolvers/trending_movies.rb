# frozen_string_literal: true

module Resolvers
  class TrendingMovies < AuthBase
    type Types::Connections::MovieConnection, null: false

    def resolve
      match_operation ::Movie::Operation::Index.call(trending: true)
    end
  end
end
