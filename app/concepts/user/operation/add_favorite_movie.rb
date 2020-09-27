# frozen_string_literal: true

module User::Operation
  class AddFavoriteMovie < Trailblazer::Operation
    step Model(Movie, :find_by)
    step :persist_favorite_movie!
    step :result

    def persist_favorite_movie!(_ctx, model:, current_user:, **)
      FavoriteMovie.create!(user_account: current_user, movie: model)
    end

    def result(ctx, model:, **)
      ctx['result'] = model
    end
  end
end
