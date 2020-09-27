# frozen_string_literal: true

module User::Operation
  class RemoveFavoriteMovie < Trailblazer::Operation
    step Model(FavoriteMovie, :find_by)
    step :destroy!
    step :result

    def destroy!(_ctx, model:, **)
      model.destroy!
    end

    def result(ctx, model:, **)
      ctx['result'] = { removed_movie_id: model.id }
    end
  end
end
