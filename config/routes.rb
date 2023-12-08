Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'homes#index'
  devise_for :users

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
