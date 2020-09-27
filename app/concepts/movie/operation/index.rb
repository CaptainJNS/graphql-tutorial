# frozen_string_literal: true

module Movie::Operation
  class Index < Trailblazer::Operation
    step :movies
    # pass :trending_movies
    step :set_result

    def movies(ctx, filter: nil, **)
      ctx[:movies] = ::Movie.where("title LIKE '#{filter}%'")
    end

    # def trending_movies(_ctx, movies:, trending: false, **)
    #   # How I have to find out which movies are trending?
    #   movies = movies.where(popular: true) if trending
    # end

    def set_result(ctx, movies:, **)
      ctx['result'] = movies
    end
  end
end
