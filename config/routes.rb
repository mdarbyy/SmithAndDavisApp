Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  authenticated :user do

    resources :sales_records
    resources :items
    resources :sales_people
    resources :settings
    resources :users

    post 'admin/users', to: 'users#create', as: 'admin_create_user'
    get 'static_pages/dashboard', to: 'static_pages#dashboard', as: 'dashboard'
    post "/create_multiple_sales_records", to: "sales_records#create_multiple_sales_records"
  end

  root "static_pages#dashboard"
end