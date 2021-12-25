Rails.application.routes.draw do
  resources :metrics, only: :index
  resources :metric_increases, only: [:new, :create]
  root "metrics#index"
end
