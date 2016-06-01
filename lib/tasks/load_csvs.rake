namespace :load_csvs do

  task load_merchants: :environment do
    CSV.foreach("#{Rails.root}/data/merchants.csv", headers: true, :symbolize_headers) do |row|
      Merchant.create(row.to_h)
    end
  end

  task load_items: :environment do
    CSV.foreach("#{Rails.root}/data/items.csv", headers: true, :symbolize_headers) do |row|
      Item.create(row.to_h)
    end
  end

  task load_customers: :environment do
    CSV.foreach("#{Rails.root}/data/customers.csv", headers: true, :symbolize_headers) do |row|
      Customer.create(row.to_h)
    end
  end

  task load_invoices: :enviroment do
    CSV.foreach("#{Rails.root}/data/invoices.csv", headers: true, :symbolize_headers) do |row|
      Invoice.create(row.to_h)
  end

  task load_invoice_items: :enviroment do
    CSV.foreach("#{Rails.root}/data/invoice_items.csv", headers: true, :symbolize_headers) do |row|
      Invoice_Item.create(row.to_h)
  end

  task load_transactions: :enviroment do
    CSV.foreach("#{Rails.root}/data/transactions.csv", headers: true, :symbolize_headers) do |row|
      Transaction.create(row.to_h)
  end

  task all: :environment do
    load_merchants
    load_items
    load_customers
    load_invoice_items
    load_invoices
    load_transactions
  end
  
end
