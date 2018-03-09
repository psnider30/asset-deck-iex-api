Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :assets, only: [:create, :index]
    post '/login', to: "sessions#create"
    post '/signup', to: "registrations#create"
    delete '/assets/delete', to: "assets#destroy"
  end
end
