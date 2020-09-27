# frozen_string_literal: true

module Types
  class UserAccountType < Base::Object
    I18N_PATH = 'graphql.types.user_account_type'

    graphql_name 'UserAccountType'
    implements Types::Interfaces::Node

    description I18n.t("#{I18N_PATH}.desc")

    field :email,
          String,
          null: false,
          description: I18n.t("#{I18N_PATH}.fields.email")

    field :user_profile,
          Types::UserProfileType,
          null: true,
          description: I18n.t("#{I18N_PATH}.fields.user_profile")

    field :lists, [ListType], null: false, description: I18n.t("#{I18N_PATH}.fields.lists")

    def lists
      BatchLoader::GraphQL.for(object.id).batch(default_value: [], key: object.id) do |record_ids, loader|
        ::List
          .where(user_account_id: record_ids)
          .each do |list|
            loader.call(object.id) { |memo| memo << list }
          end
      end
    end
    # Home task
    # field :watch_list_movies
    # field :favorite_movies
  end
end
