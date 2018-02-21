Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :bugs
  resources :projetos
  devise_for :usuarios, controllers: { sessions: 'usuarios/sessions' }
end
