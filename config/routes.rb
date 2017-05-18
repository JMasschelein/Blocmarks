Rails.application.routes.draw do
  
   resources :topics do
     resources :bookmarks, except: [:index]
   end

devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations'
  }
    
  get 'welcome/index'

  root 'welcome#index'
end
