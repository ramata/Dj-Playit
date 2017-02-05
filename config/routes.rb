Rails.application.routes.draw do
  root to: 'welcome#index'
  devise_for :users

  # resources :users do
  resources :comments
  # resources :songs

 root "song#index"
 get '/song' => "song#song"
 get '/about' => "song#about"

root "comments#index"
get '/comments/new' => "comments#new"

  end
#song routes


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
