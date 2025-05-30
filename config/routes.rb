Rails.application.routes.draw do
  devise_for :users
  root "pages#home"

  get "about", to: "pages#about"
  get "contact", to: "pages#contact"
  post "contact", to: "pages#submit_contact"

  resources :users, only: [ :index, :show, :new, :create, :edit, :update ]
  resources :chats, only: [ :index, :show, :new, :create, :edit, :update ]
  resources :messages, only: [ :index, :show, :new, :create, :edit, :update ]
end
