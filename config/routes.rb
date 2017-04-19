Rails.application.routes.draw do
  root 'pages#index'
  get 'clear', to: 'pages#expire_page'
  get '/restricted', to: 'pages#restricted'
  resources :products, only: [:index, :show]
end
