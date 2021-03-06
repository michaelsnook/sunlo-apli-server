Rails.application.routes.draw do
  root "home#index"

  resources :languages, :decks, :phrases, :cards, :translations

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)
end
