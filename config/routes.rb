Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get "/:model"
      get "/:model/find", to: "models/find#show"
      get "/:model/find_all", to: "models/find#index"
      get "/:model/random", to: "models/random#show"
      get "/:model/:model_id/:relationship", to: "models/relationships#index"
      resources :merchants, only: [ :index, :show ]
      resources :customers, only: [ :index, :show ]
      resources :items, only: [ :index, :show ]
      resources :invoices, only: [ :index, :show ]
      resources :invoice_items, only: [ :index, :show ]
      resources :transactions, only: [ :index, :show ]
    end
  end

end
