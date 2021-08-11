Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api,defaults: { format: 'json' } do
    namespace :v1 do
     get "api/users" => "users#index" 
     get "find/user/:user_id" => "users#show"
     post "create/user" => "users#create"
     delete "delete/user/:user_id" =>"users#delete"
     get "search/:keyword" => "users#search"
    end
   end
end
