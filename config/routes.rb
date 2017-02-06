Rails.application.routes.draw do
  root to: 'welcome#index'
  devise_for :users

   resources :users do
     resources :comments
     resources :songs
   end
#    resources :users do |users|
#      users.resources  :songs
# end

  resources :songs

 root "song#index"
 # get '/song' => "song#song"
 get '/about' => "song#about"


root "comments#index"
resources :comments

root 'artists#index'
resources :artists

  end
#song routes


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
