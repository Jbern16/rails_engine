Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get "merchants/random", to: "merchants#random"
      get "merchants/find", defaults: { format: :json }, to: "merchants#find"
      get "merchants/find_all", defaults: { format: :json }, to: "merchants#find_all"
      resources :merchants, only: [ :index, :show ]
    end
  end

end
