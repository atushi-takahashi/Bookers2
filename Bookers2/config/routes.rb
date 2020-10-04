Rails.application.routes.draw do
  root 'users#top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:top,:index,:show,:edit,:update]
  resources :books, only: [:index,:show,:create]
end
