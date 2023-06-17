Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :buying_records, only: [:create, :index]
  end
end
