Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get "merchants/random", to: "merchants#random"
      get "merchants/find", to: "merchants#find"
      get "merchants/find_all", to: "merchants#find_all"
      resources :merchants, only: [ :index, :show ] do
        get '/items', to: "items#find_all"
        get '/invoices', to: "invoices#find_all"
      end

      get "customers/random", to: "customers#random"
      get "customers/find", to: "customers#find"
      get "customers/find_all", to: "customers#find_all"
      resources :customers, only: [ :index, :show ] do
        get 'invoices', to: "invoices#find_all"
        get 'transactions', to: "customers/transactions#index"
      end

      get "items/random", to: "items#random"
      get "items/find", to: "items#find"
      get "items/find_all", to: "items#find_all"
      resources :items, only: [ :index, :show ] do
        get '/invoice_items', to: "invoice_items#find_all"
        get '/merchant', to: "items/merchant#show"
      end

      get "invoices/random", to: "invoices#random"
      get "invoices/find", to: "invoices#find"
      get "invoices/find_all", to: "invoices#find_all"
      resources :invoices, only: [ :index, :show ] do
        get "transactions", to: "transactions#find_all"
        get "invoice_items", to: "invoice_items#find_all"
        get "items", to: "invoices/items#index"
        get "customer", to: "invoices/customer#show"
        get "merchant", to: "invoices/merchant#show"
      end

      get "invoice_items/random", to: "invoice_items#random"
      get "invoice_items/find", to: "invoice_items#find"
      get "invoice_items/find_all", to: "invoice_items#find_all"
      resources :invoice_items, only: [ :index, :show ] do
        get "invoice", to: "invoice_items/invoice#show"
        get "item", to: "invoice_items/item#show"
      end

      get "transactions/random", to: "transactions#random"
      get "transactions/find", defaults: { format: :json }, to: "transactions#find"
      get "transactions/find_all", defaults: { format: :json }, to: "transactions#find_all"
      resources :transactions, only: [ :index, :show ] do
        get "invoice", to: "transactions/invoice#show"
      end
    end
  end

end
