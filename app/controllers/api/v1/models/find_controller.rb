class Api::V1::Models::FindController < ApiController
  before_action :change_currency

  def index
    respond_with model.where(selector)
  end

  def show
    respond_with model.find_by(selector)
  end

end
