# frozen_string_literal: true

Rails.application.routes.draw do
  get '/api/health', to: proc { [200, {}, ['Healthy']] }

  post '/graphql', to: 'graphql#execute'
end
