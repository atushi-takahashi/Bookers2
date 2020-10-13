Rails.application.routes.draw do
  

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'toppage#top'
  get 'home/about' => 'toppage#about'
  resources :users, only: [:index, :create, :show, :edit, :update]
  resources :books, only: [:index, :show, :edit, :update, :create, :destroy]
  
end