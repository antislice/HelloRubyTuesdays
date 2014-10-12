HelloRubyTuesday::Application.routes.draw do

  ActiveAdmin.routes(self) rescue nil

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks', :registrations => 'registrations' }

  resources :users do
    member do
      get 'links_index'
    end
  end
  resources :links
 
  root to: 'static_pages#home'
  
  as :user do
    get '/signup' => 'devise/registrations#new'
    get '/signin' => 'devise/sessions#new'
    get '/signout' => 'devise/sessions#destroy'
    get '/users/edit' => 'devise/registrations#edit'
  end

  get 'tags/:tag', to: 'tags#show', :as => :tag

end

