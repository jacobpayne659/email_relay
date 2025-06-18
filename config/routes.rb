Rails.application.routes.draw do
  resources :users
  root to: "email_groups#index"
  resources :email_groups

  get "up" => "rails/health#show", as: :rails_health_check
end
