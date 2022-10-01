# frozen_string_literal: true

Rails.application.routes.draw do
  root 'articles#index'

  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout'
             }

  resources :articles
  resource :users, only: %i[show edit update]

  get ':slug', to: 'articles#show', as: :slug
end
