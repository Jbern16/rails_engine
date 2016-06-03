describe "GET /api/v1/merchants/:id/revenue" do
  it "returns the total revenue for that merchant across all transactions" do
    transaction = create(:transaction)
    invoice = transaction.invoice
    merchant = invoice.merchant
    invoice_item = create(:invoice_item, invoice: invoice)

  get  "/api/v1/merchants/#{merchant_id}/revenue"

  expect(json_body).to eq({
    "total_revenue" => "#{invoice_item.unit_price * invoice_item.quantity}"
    })
  end
end

describe '/api/v1/merchants/:id/favorite_customer' do
  it "returns the customer who has conducted the most total number of successful transactions" do
    transaction = create(:transaction)
    invoice = transaction.invoice
    merchant = invoice.merchant
    customer = invoice.customer
    invoice_item = create(:invoice_item, invoice: invoice)

    get "/api/v1/merchants/revenue?date=#{invoice_item.created_at}"

    expect(json_body).to_eq({
      customer.id
      })
  end
end

describe 'GET /api/v1/merchants/:id/customers_with_pending_invoices' do
  it "returns a collection of customers which have pending invoices" do
    transaction = create(:transaction)
    invoice = transaction.invoice
    merchant = invoice.merchant
    customer = invoice.customer
    invoice_item = create(:invoice_item, invoice: invoice)

    get "/api/v1/merchants/#/customers_with_pending_invoices"
end
