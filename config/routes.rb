Rails.application.routes.draw do
  resources :authentication, :only => [:create]
  post 'signup', to: 'users#create'
  resources :expenses do
    resources :measurements
  end

end
