# frozen_string_literal: true

Rails.application.routes.draw do
  resources :metrics, only: :index
  resources :metric_increases, only: %i[new create]
  root "metrics#index"
end
