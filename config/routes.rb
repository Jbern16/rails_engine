Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get "merchants/random", to: "merchants#random"
      get "merchants/find", defaults: { format: :json }, to: "merchants#find"
      get "merchants/find_all", defaults: { format: :json }, to: "merchants#find_all"
      resources :merchants, only: [ :index, :show ]

      get "customers/random", to: "customers#random"
      get "customers/find", defaults: { format: :json }, to: "customers#find"
      get "customers/find_all", defaults: { format: :json }, to: "customers#find_all"
      resources :customers, only: [ :index, :show ]

      get "items/random", to: "items#random"
      get "items/find", defaults: { format: :json }, to: "items#find"
      get "items/find_all", defaults: { format: :json }, to: "items#find_all"
      resources :items, only: [ :index, :show ]

      get "invoices/random", to: "invoices#random"
      get "invoices/find", defaults: { format: :json }, to: "invoices#find"
      get "invoices/find_all", defaults: { format: :json }, to: "invoices#find_all"
      resources :invoices, only: [ :index, :show ]

      get "invoice_items/random", to: "invoice_items#random"
      get "invoice_items/find", defaults: { format: :json }, to: "invoice_items#find"
      get "invoice_items/find_all", defaults: { format: :json }, to: "invoice_items#find_all"
      resources :invoice_items, only: [ :index, :show ]
    end
  end

end
