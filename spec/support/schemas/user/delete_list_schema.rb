# frozen_string_literal: true

module User
  module DeleteListSchema
    Success = Dry::Validation.Schema do
      input :hash?

      required(:data).schema do
        required(:userDeleteList).schema do
          required(:deletedItemId).filled(:str?)
        end
      end
    end
  end
end
