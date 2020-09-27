# frozen_string_literal: true

module User::Operation
  class DeleteList < Trailblazer::Operation
    step Model(List, :find_by)
    step :destroy!
    step :result

    def destroy!(_ctx, model:, **)
      model.destroy!
    end

    def result(ctx, model:, **)
      ctx['result'] = { deleted_item_id: model.id }
    end
  end
end
