# frozen_string_literal: true

module User
  module RemoveWatchlistMovieSchema
    Success = Dry::Validation.Schema do
      input :hash?

      required(:data).schema do
        required(:userRemoveWatchlistMovie).schema do
          required(:deletedItemId).filled(:str?)
        end
      end
    end
  end
end
