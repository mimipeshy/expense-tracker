Rails.application.routes.draw do
  resources :expenses
  resources :users
  resources :books
  resources :reviews
end
