class Api::V1::Items::MerchantController < ApiController

  def show
    respond_with Item.find(params[:item_id]).merchant
  end
  
end
