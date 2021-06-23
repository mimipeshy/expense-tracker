Rails.application.routes.draw do
  resources :users
    resources :expenses
      resources :measurements

end
