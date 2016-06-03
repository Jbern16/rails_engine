describe "GET /api/v1/merchants/most_revenue?quantity=x" do
  it "return the top 1 merchants ranked by total revenue" do
    invoice_item = create(:invoice_item, quantity: 1000, unit_price: 5000)
    invoice = invoice_item.invoice
    merchant = invoice.merchant

    invoice_item2 = create(:invoice_item)
    invoice2 = invoice_item2.invoice
    merchant2 = invoice2.merchant

    get "/api/v1/merchants/most_revenue?quantity=1"

    expect(json_body[0]).to eq({
      "id" => merchant.id,
      "name" => merchant.name
    })
  end
end

describe "GET /api/v1/merchants/most_items?quantity=x" do
  it "return the top 1 merchants ranked by items sold" do
    transaction = create(:transaction)
    invoice = transaction.invoice
    merchant = invoice.merchant
    invoice_item = create(:invoice_item, invoice: invoice)

    get "/api/v1/merchants/most_items?quantity=1"

    expect(json_body[0]).to eq({
      "id" => merchant.id,
      "name" => merchant.name

    })
  end
end

describe 'GET /api/v1/merchants/revenue?date=x' do
  it "returns the top merchants by date" do
    transaction = create(:transaction)
    invoice = transaction.invoice
    merchant = invoice.merchant
    customer = invoice.customer
    invoice_item = create(:invoice_item, invoice: invoice)

    get "/api/v1/merchants/revenue?date=#{invoice_item.created_at}"

    expect(json_body).to eq({
    "total_revenue" => "250.0"
    })

  end
end
