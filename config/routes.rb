Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api,defaults: { format: 'json' } do
    namespace :v1 do
     get "api/users" => "users#get_users" 
     get "find/user/:user_id" => "users#user_by_id"
     post "create/user" => "users#create_user"
     delete "delete/user/:user_id" =>"users#delete_user"
    end
   end
end
