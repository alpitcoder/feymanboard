Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "users#new"

  resources :users do
    resources :topics
  end

  get :show_topic, to: 'topics#show'




end
