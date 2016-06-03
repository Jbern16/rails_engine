class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def self.favorite_merchant(id)
    find_by(id).merchants.joins(invoices: [:transactions])
    .where(transactions: {result: "success"})
    .group(:id)
    .order('count(invoices.merchant_id) DESC').first
  end
end
