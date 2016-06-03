class MerchantSerializer < ActiveModel::Serializer
  attributes :id, :name

  def revenue
    { "total_revenue" => (object.revenue.to_f / 100.00).to_s}
  end
end
