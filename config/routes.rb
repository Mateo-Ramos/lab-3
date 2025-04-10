Rails.application.routes.draw do
  get "messages/create"
  get "chats/index"
  get "chats/show"
  get "chats/create"
  get "users/index"
  root "pages#home"
  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"
  post "/contact", to: "pages#submit_contact"
end
