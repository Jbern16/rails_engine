require 'csv'

namespace :load_csvs do

  task load_merchants: :environment do
    CsvLoader.new("merchants", Merchant)
  end

  task load_items: :environment do
    CsvLoader.new("items", Item)
  end

  task load_customers: :environment do
    
  end

  task load_invoices: :environment do
    CSV.foreach("#{Rails.root}/db/data/invoices.csv", headers: true) do |row|
      Invoice.create(row.to_h)
    end
  end

  task load_invoice_items: :environment do
    CSV.foreach("#{Rails.root}/db/data/invoice_items.csv", headers: true) do |row|
      InvoiceItem.create(row.to_h)
    end
  end

  task load_transactions: :environment do
    CSV.foreach("#{Rails.root}/db/data/transactions.csv", headers: true) do |row|
      Transaction.create(row.to_h)
    end
  end

  task all: [
    :load_merchants,
    :load_items,
    :load_customers,
    :load_invoices,
    :load_invoice_items,
    :load_transactions,
  ]

end
