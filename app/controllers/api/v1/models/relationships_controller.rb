class Api::V1::Models::RelationshipsController < ApiController
  def index
    respond_with model.find(params[:model_id]).send(relationship)
  end
end
