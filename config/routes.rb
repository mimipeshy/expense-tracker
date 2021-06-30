Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :authentication, :only => [:create]
  # post 'signup', to: 'users#create'
  resources :users
  resources :expenses do
    resources :measurements
  end
end
