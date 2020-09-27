# frozen_string_literal: true

module Mutations
  module User
    class AddFavoriteMovie < AuthenticableMutation
      type Types::MovieType

      description I18n.t('graphql.mutations.user.add_favorite_movie.desc')

      argument :input, Types::Inputs::UserFavoriteMovieInput, required: true

      def resolve(input:)
        match_operation ::User::Operation::AddFavoriteMovie.call(
          params: input.to_h,
          current_user: current_user
        )
      end
    end
  end
end
