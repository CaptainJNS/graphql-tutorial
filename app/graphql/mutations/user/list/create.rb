# frozen_string_literal: true

module Mutations
  module User
    module List
      class Create < AuthenticableMutation
        type Types::UserAccountType

        description I18n.t('graphql.mutations.user.create_list.desc')

        argument :input, Types::Inputs::UserCreateListInput, required: true

        def resolve(input:)
          match_operation ::User::Operation::CreateList.call(
            params: input.to_h,
            current_user: current_user
          )
        end
      end
    end
  end
end
