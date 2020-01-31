# frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'
require 'graphql/rake_task'

Rails.application.load_tasks

GraphQL::RakeTask.new(
  schema_name: 'GraphQLMeetupSchema',
  idl_outfile: 'schema.graphql',
  json_outfile: 'schema.json'
)