Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  authenticated :user do

    resources :settings
    resources :users

    post 'admin/users', to: 'users#create', as: 'admin_create_user'
    get 'static_pages/dashboard', to: 'static_pages#dashboard', as: 'dashboard'
  end

  root "users#index"
end
