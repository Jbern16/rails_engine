describe "GET /api/v1/merchants/:id/revenue" do
  it "returns the total revenue for that merchant across all transactions" do
    transaction = create(:transaction)
    invoice = transaction.invoice
    merchant = invoice.merchant
    invoice_item = create(:invoice_item, invoice: invoice)

  get  "/api/v1/merchants/#{merchant.id}/revenue"

  expect(json_body).to eq({
    "revenue" => ((invoice_item.unit_price * invoice_item.quantity).to_f / 100).to_s
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

    get "/api/v1/merchants/#{merchant.id}/favorite_customer"

    expect(json_body.count).to eq 3

  end
end

describe 'GET /api/v1/merchants/:id/customers_with_pending_invoices' do
  it "returns a collection of customers which have pending invoices" do
    transaction = create(:transaction, result: "failed")
    invoice = transaction.invoice
    merchant = invoice.merchant
    customer = invoice.customer
    invoice_item = create(:invoice_item, invoice: invoice)

    get "/api/v1/merchants/#{merchant.id}/customers_with_pending_invoices"

    expect(json_body.count).to eq 1
  end
end
