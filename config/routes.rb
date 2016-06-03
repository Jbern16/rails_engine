Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get "/:model", to: "models#index"
      get "/:model/find", to: "models/find#show"
      get "/:model/find_all", to: "models/find#index"
      get "/:model/random", to: "models/random#show"
      get "/:model/:id", to: "models#show", constraints: { id: /\d+/}
      get "/:model/:logic", to: "models/logic#index"
      get "/:model/:id/:logic", to: "models/logic#show", constraints: { logic: /most_revenue|most_items|revenue|favorite_customer|customers_with_pending_invoices|quantity|best_day|favorite_merchant/}
      get "/:model/:model_id/:relationship", to: "models/relationships#index"
    end
  end
end
