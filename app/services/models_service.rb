module ModelsService
  def model
    params[:model].classify.constantize
  end

  def selector
    params.permit(all_columns)
  end

  def all_columns
    Merchant.column_names | Customer.column_names | InvoiceItem.column_names |
    Transaction.column_names | Item.column_names | Invoice.column_names
  end

  def change_currency
    params[:unit_price] = (params[:unit_price].to_f * 100).round if params[:unit_price]
  end
end
