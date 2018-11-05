Rails.application.routes.draw do
  resources :articles
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#welcome"
  resources :users, only: [:index, :show]

end