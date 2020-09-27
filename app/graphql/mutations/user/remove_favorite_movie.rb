# frozen_string_literal: true

module Mutations
  module User
    class RemoveFavoriteMovie < AuthenticableMutation
      type Types::DeletedItemType

      description I18n.t('graphql.mutations.user.remove_favorite_movie.desc')

      argument :input, Types::Inputs::UserItemIdInput, required: true

      def resolve(input:)
        match_operation ::User::Operation::RemoveFavoriteMovie.call(
          params: input.to_h
        )
      end
    end
  end
end
