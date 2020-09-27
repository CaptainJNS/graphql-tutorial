# frozen_string_literal: true

module Mutations
  module User
    module WatchlistMovie
      class Create < AuthenticableMutation
        type Types::MovieType

        description I18n.t('graphql.mutations.user.create_watchlist_movie.desc')

        argument :input, Types::Inputs::UserItemIdInput, required: true

        def resolve(input:)
          match_operation ::User::Operation::CreateWatchlistMovie.call(
            params: input.to_h,
            current_user: current_user
          )
        end
      end
    end
  end
end
