Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  authenticated :user do
    resources :shifts
    resources :sales_records
    resources :items
    resources :sales_people
    resources :settings
    resources :users

    post 'admin/users', to: 'users#create', as: 'admin_create_user'
    get 'static_pages/dashboard', to: 'static_pages#dashboard', as: 'dashboard'
    get 'sales_people/:id/show_shifts', to: 'sales_people#show_shifts', as: 'show_shifts'
    post "/create_multiple_sales_records", to: "sales_records#create_multiple_sales_records"
  end

  root "static_pages#dashboard"
end