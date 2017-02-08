Rails.application.routes.draw do
  root to: 'comments#index'
  devise_for :users

   resources :users do
     resources :comments
     resources :songs
   end


 resources :songs

 root "song#index"
 get '/about' => "welcome#about"


root "comments#index"
resources :comments

root 'artists#index'
resources :artists

  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
