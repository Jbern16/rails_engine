class Api::V1::Models::LogicController < ApiController
  def index
    respond_with model.send(params[:logic], logic_selector)
  end

  def show
    respond_with model.send(params[:logic], logic_selector)
  end
end
