class Api::V1::Invoices::RelationshipsController < ApiController

  def index
    respond_with relationship
  end

  def show
    respond_with relationship
  end


  private

    def relationship
      Invoice.find(params[:invoice_id]).send(controller_name)
    end

end
