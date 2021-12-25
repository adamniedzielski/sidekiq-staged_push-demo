Rails.application.routes.draw do
  resources :metrics, only: :index
  root "metrics#index"
end
