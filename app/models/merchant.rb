class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :customers, through: :invoices


  def self.most_revenue(limit)
     joins(:invoice_items).group(:id).order("sum(invoice_items.unit_price * invoice_items.quantity) DESC")
     .limit(limit["quantity"].to_i)
  end

  def self.most_items(limit)
    joins(invoices: [:transactions, :invoice_items])
    .where(transactions: {result: "success"})
    .group(:id).order("sum(invoice_items.quantity) DESC").limit(limit["quantity"].to_i)
  end

  def self.revenue(params)
    if !(params[:id] && params[:date]).nil?
      revenue_by_date(params[:id], params[:date])
    elsif params[:id]
      revenue_single(params[:id])
    else
      total_revenue_by_date(params[:date])
    end
  end

  def self.revenue_single(id)
    revenue = joins(invoices: [:transactions, :invoice_items])
    .where(transactions: {result: "success"})
    .where("merchants.id = ?", id)
    .sum("invoice_items.unit_price * invoice_items.quantity")

    {"revenue" => (revenue.to_f / 100).to_s }
  end

  def self.revenue_by_date(id, date)
    revenue = joins(invoices: [:transactions, :invoice_items])
    .where(transactions: {result: "success"})
    .where("invoices.created_at =?", date)
    .where("merchants.id = ?", id)
    .sum("invoice_items.unit_price * invoice_items.quantity")

    {"revenue" => (revenue.to_f / 100).to_s }
  end

  def self.total_revenue_by_date(date)
    revenue = joins(invoices: [:invoice_items])
    .where("invoices.created_at = ?", date)
    .sum("invoice_items.unit_price * invoice_items.quantity")

    {"total_revenue" => (revenue.to_f / 100).to_s }
  end

  def self.favorite_customer(id)
    find_by(id).customers.joins(:transactions)
    .where(transactions: {result: "success"})
    .group(:id)
    .order('count(invoices.customer_id) DESC').first
  end

  def self.customers_with_pending_invoices(id)
    find_by(id).invoices.joins(:transactions)
    .where(transactions: {result: "failed"})
    .joins(:customer).uniq
  end

end
