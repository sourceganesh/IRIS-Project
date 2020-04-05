Rails.application.routes.draw do
  root to: "items#index"
  resources :items
  devise_for :users
  get 'items/bid/:id', to: 'items#bid', as: :items_bid
  patch 'items/bidupdate/:id', to: 'items#bidupdate', as: :items_bidupdate
  patch 'items/claim/:id', to: 'items#claim', as: :items_claim
  get '/useritem', to: 'items#useritem'
  get '/biditem', to: 'items#biditem'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
