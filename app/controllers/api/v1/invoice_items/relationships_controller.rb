class Api::V1::InvoiceItems::RelationshipsController < ApiController

  def show
    respond_with InvoiceItem.find(params[:invoice_item_id]).send(controller_name)
  end

end
