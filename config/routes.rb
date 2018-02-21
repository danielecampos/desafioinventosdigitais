Rails.application.routes.draw do
  devise_for :user
  resources :projetos
  resources :bugs
  root 'home#index'
end
