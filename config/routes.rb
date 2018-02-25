Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :projetos
  resources :bugs
  root 'home#index'
end
