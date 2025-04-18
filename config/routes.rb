Rails.application.routes.draw do
  root "pages#home"

  get "about", to: "pages#about"
  get "contact", to: "pages#contact"
  post "contact", to: "pages#submit_contact"

  resources :users, only: [ :index, :show ]
  resources :chats, only: [ :index, :show ]
  resources :messages, only: [ :index, :show ]
end
