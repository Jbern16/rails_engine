class Api::V1::Models::RandomController < ApiController
  def show
    respond_with model.order("RANDOM()").first
  end
end
