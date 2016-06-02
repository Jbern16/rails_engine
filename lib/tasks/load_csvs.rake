require 'csv_loader'

namespace :load_csvs do

  task load_merchants: :environment do
    CsvLoader.new("merchants", Merchant)
  end

  task load_items: :environment do
    CsvLoader.new("items", Item)
  end

  task load_customers: :environment do
    CsvLoader.new("customers", Customer)
  end

  task load_invoices: :environment do
    CsvLoader.new("invoices", Invoice)
  end

  task load_invoice_items: :environment do
    CsvLoader.new("invoice_items", InvoiceItem)
  end

  task load_transactions: :environment do
    CsvLoader.new("transactions", Transaction)
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
