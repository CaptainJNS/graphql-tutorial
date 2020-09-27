# frozen_string_literal: true

module User::Operation
  class CreateWatchlistMovie < Trailblazer::Operation
    step Model(Movie, :find_by)
    step :persist_watchlist_movie!
    step :result

    def persist_watchlist_movie!(_ctx, model:, current_user:, **)
      WatchlistMovie.create!(user_account: current_user, movie: model)
    end

    def result(ctx, model:, **)
      ctx['result'] = model
    end
  end
end
