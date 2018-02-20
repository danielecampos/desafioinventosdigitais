Rails.application.routes.draw do
  resources :bugs
  resources :projetos
  devise_for :usuarios, controllers: { sessions: 'usuarios/sessions' }
end
