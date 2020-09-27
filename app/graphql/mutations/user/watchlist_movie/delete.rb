# frozen_string_literal: true

module Mutations
  module User
    module WatchlistMovie
      class Delete < AuthenticableMutation
        type Types::DeletedItemType

        description I18n.t('graphql.mutations.user.delete_watchlist_movie.desc')

        argument :input, Types::Inputs::UserItemIdInput, required: true

        def resolve(input:)
          match_operation ::User::Operation::DeleteWatchlistMovie.call(
            params: input.to_h,
            current_user: current_user
          )
        end
      end
    end
  end
end
