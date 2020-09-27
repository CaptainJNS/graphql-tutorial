# frozen_string_literal: true

module Types
  class DeletedItemType < Base::Object
    I18N_PATH = 'graphql.types.deleted_item'
    graphql_name 'DeletedItemType'

    description I18n.t("#{I18N_PATH}.desc")

    field :deleted_item_id,
          String,
          null: false,
          description: I18n.t("#{I18N_PATH}.fields.deleted_item_id")
  end
end
