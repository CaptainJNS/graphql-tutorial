# frozen_string_literal: true

module User::Operation
  class CreateList < Trailblazer::Operation
    step :persist_list!
    step :result

    def persist_list!(_ctx, params:, current_user:, **)
      List.create!(user_account: current_user, name: params[:name])
    end

    def result(ctx, current_user:, **)
      ctx['result'] = current_user
    end
  end
end
