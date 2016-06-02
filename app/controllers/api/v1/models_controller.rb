class Api::V1::ModelsController < ApiController
  def index
    respond_with model.all
  end

  def show
    respond_with model.find(params[:id])
  end
end
