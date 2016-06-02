class Api::V1::ObjectsController < ApiController
  def index
    respond_with model.all
  end

  def show
    respond_with model.find(params[:id])
  end

  private

    def model
     controller_name.classify.constantize
    end
end
