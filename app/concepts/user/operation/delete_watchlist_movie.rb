# frozen_string_literal: true

module User::Operation
  class DeleteWatchlistMovie < Trailblazer::Operation
    step :model
    step :destroy!
    step :result

    def model(ctx, current_user:, params:, **)
      ctx[:model] = current_user.watchlist_movies.find_by(movie_id: params[:id])
    end

    def destroy!(_ctx, model:, **)
      model.destroy!
    end

    def result(ctx, model:, **)
      ctx['result'] = { deleted_item_id: model.id }
    end
  end
end
