Rails.application.routes.draw do
  root to: "items#index"
  resources :items
  devise_for :users
  get 'items/bid/:id', to: 'items#bid', as: :items_bid
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
