# frozen_string_literal: true

Rails.application.routes.draw do
  resources :products, only: %i[index show] do
    member do
      post :add_item
    end
  end
  
  resources :search, only: [:index] do
    collection do
      get 'results'
    end
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'products#index'
end
