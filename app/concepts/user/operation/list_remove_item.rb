# frozen_string_literal: true

module User::Operation
  class ListRemoveItem < Trailblazer::Operation
    step :model
    step :destroy!
    step :result

    def model(ctx, params:, **)
      ctx[:model] = ListsMovie.find_by(list_id: params[:list_id], movie_id: params[:movie_id])
    end

    def destroy!(_ctx, model:, **)
      model.destroy!
    end

    def result(ctx, model:, **)
      ctx['result'] = { deleted_item_id: model.id }
    end
  end
end
