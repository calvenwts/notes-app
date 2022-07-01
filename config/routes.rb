# frozen_string_literal: true

Rails.application.routes.draw do
  resources :notebooks do
    resources :pages do
      resources :paragraphs
    end
  end
  devise_for :users
  root to: 'home#index'
end
