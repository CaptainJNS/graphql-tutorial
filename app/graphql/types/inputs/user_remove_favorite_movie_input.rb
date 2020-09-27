# frozen_string_literal: true

module Types
  module Inputs
    class UserRemoveFavoriteMovieInput < ::Types::Base::InputObject
      I18N_PATH = 'graphql.inputs.user.remove_favorite_movie'

      graphql_name 'UserRemoveFavoriteMovieInput'

      description I18n.t("#{I18N_PATH}.desc")

      argument :id,
               ID,
               required: true,
               description: I18n.t("#{I18N_PATH}.args.id")
    end
  end
end
