Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root "welcome#index"
  namespace :api do
    resources :assets, only: [:create]

    post '/login', to: "sessions#create"
    post '/signup', to: "registrations#create"
    delete '/assets/delete', to: "assets#destroy"
    put '/assets/update', to: "assets#update"
    post '/assets/user-assets', to: "assets#index"
    post '/assets/update-shares', to: "user_assets#update"
  end
end
