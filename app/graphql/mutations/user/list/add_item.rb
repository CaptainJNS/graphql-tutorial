# frozen_string_literal: true

module Mutations
  module User
    module List
      class AddItem < AuthenticableMutation
        type Types::ListType

        description I18n.t('graphql.mutations.user.list_add_item.desc')

        argument :input, Types::Inputs::UserListItemInput, required: true

        def resolve(input:)
          match_operation ::User::Operation::ListAddItem.call(
            params: input.to_h
          )
        end
      end
    end
  end
end
