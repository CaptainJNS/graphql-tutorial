# frozen_string_literal: true

module Mutations
  module User
    class DeleteList < AuthenticableMutation
      type Types::DeletedItemType

      description I18n.t('graphql.mutations.user.delete_list.desc')

      argument :input, Types::Inputs::UserItemIdInput, required: true

      def resolve(input:)
        match_operation ::User::Operation::DeleteList.call(
          params: input.to_h
        )
      end
    end
  end
end
