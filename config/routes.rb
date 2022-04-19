Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  
  devise_for :users
  root 'movies#index'
       'users#index'
       'statics#index'
  resources :users, only: [:show,:create]
  resources :movies do
    resources :likes, only: [:create, :destroy, :get]
delete 'movies/:id'=> 'movies#destroy'
  end
  resources :statics
  
  
      

  
  
end

