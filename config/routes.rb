# frozen_string_literal: true

require "sidekiq/web"

Rails.application.routes.draw do
  resources :metrics, only: :index
  resources :metric_increases, only: %i[new create]
  root "metrics#index"

  mount Sidekiq::Web => "/sidekiq"
end
