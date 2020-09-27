# frozen_string_literal: true

module User::Operation
  class ListAddItem < Trailblazer::Operation
    step :list
    step :movie
    step :persist_list_item!
    step :result

    def list(ctx, params:, **)
      ctx[:list] = List.find_by(id: params[:list_id])
    end

    def movie(ctx, params:, **)
      ctx[:movie] = Movie.find_by(id: params[:movie_id])
    end

    def persist_list_item!(_ctx, list:, movie:, **)
      ListsMovie.create!(list: list, movie: movie)
    end

    def result(ctx, list:, **)
      ctx['result'] = list
    end
  end
end
