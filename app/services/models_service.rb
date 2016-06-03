module ModelsService
  def model
    params[:model].classify.constantize
  end

  def relationship
    params[:relationship] if table_names.include?(params[:relationship].pluralize)
  end

  def selector
    params.permit(model.column_names)
  end

  def table_names
    ActiveRecord::Base.connection.tables
  end

  def change_currency
    params[:unit_price] = (params[:unit_price].to_f * 100).round if params[:unit_price]
  end

  def logic_selector
    params.permit(:quantity, :date, :id)
  end
end
