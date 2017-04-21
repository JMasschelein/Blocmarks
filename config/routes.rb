Rails.application.routes.draw do
  

devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations'
  }
    
  get 'welcome/index'

  root 'welcome#index'
end
