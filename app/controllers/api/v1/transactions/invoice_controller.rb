class Api::V1::Transactions::InvoiceController < ApiController

  def show
    respond_with Transaction.find(params[:transaction_id]).invoice
  end
end
