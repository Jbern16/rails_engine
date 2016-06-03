class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.most_revenue(limit)
    joins(:invoice_items).group(:id).order("sum(invoice_items.unit_price * invoice_items.quantity) DESC")
    .limit(limit["quantity"].to_i)
  end

  def self.most_items(limit)
    joins(invoices: [:transactions, :invoice_items])
    .where(transactions: {result: "success"})
    .group(:id)
    .order('count(invoice_items.item_id) DESC').limit(limit["quantity"].to_i)
  end

  def self.best_day(id)
    best_day = find_by(id).invoices.joins(:transactions)
    .where(transactions: {result: "success"})
    .select("invoices.created_at")
    .group(:created_at)
    .order("sum(invoice_items.unit_price * invoice_items.quantity) DESC")
    .first.created_at

    {"best_day" => best_day}
  end
end
