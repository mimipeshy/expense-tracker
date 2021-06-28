Rails.application.routes.draw do
  resources :users do
    resources :expenses do
      resources :measurements
    end
  end
end
