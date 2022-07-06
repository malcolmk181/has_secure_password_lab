Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "sessions#new", as: "login_prompt"
  post "/", to: "sessions#create", as: "login"
  get "/signup", to: "users#new", as: "signup"
  post "/signup", to: "users#create", as: "signup_prompt"
  get "/users/:id", to: "users#show", as: "homepage"
  # post "/sessions/create", to: "sessions#create", as: "create_session_path"

end
