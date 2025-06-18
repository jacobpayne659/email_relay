Rails.application.routes.draw do
  resources :users
  root to: "email_groups#index"
  resources :email_groups do
    resources :email_group_memberships, only: [ :create, :destroy ]
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
