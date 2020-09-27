# frozen_string_literal: true

module Types
  class ListType < Base::Object
    I18N_PATH = 'graphql.types.list_type'

    graphql_name 'ListType'
    implements Types::Interfaces::NodeInterface
    description I18n.t("#{I18N_PATH}.desc")

    field :name, String, null: false, description: I18n.t("#{I18N_PATH}.fields.name")

    field :items, [MovieType], null: false, description: I18n.t("#{I18N_PATH}.fields.items")

    def items
      BatchLoader::GraphQL.for(object.id).batch(default_value: [], key: object.id) do |record_ids, loader|
        ::ListsMovie
          .includes(:movie)
          .where(list_id: record_ids)
          .each do |lists_movie|
            loader.call(object.id) { |memo| memo << lists_movie.movie }
          end
      end
    end
  end
end
