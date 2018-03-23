Rails.application.routes.draw do
  root "home#index"
  resources :home, only: [:index] do
    post :fetch_data, on: :collection
  end
end
