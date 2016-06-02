Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get "/:model", to: "models#index"
      get "/:model/find", to: "models/find#show"
      get "/:model/find_all", to: "models/find#index"
      get "/:model/random", to: "models/random#show"
      get "/:model/:id", to: "models#show"
      get "/:model/:model_id/:relationship", to: "models/relationships#index"
    end
  end

end
