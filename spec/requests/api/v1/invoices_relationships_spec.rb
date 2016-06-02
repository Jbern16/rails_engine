describe "GET /api/v1/invoices/:id/transactions" do
  it "returns a collection of associated transactions" do
    transaction = create(:transaction)
    transaction2 = create(:transaction)
    invoice = transaction.invoice
    invoice2 = transaction2.invoice

    get "/api/v1/invoices/#{invoice.id}/transactions"

    expect(json_body[0]).to eq({
      "id" => transaction.id,
      "invoice_id" => invoice.id,
      "credit_card_number" => transaction.credit_card_number,
      "result" => "success"
      })
  end
end

describe "GET /api/v1/invoices/:id/invoice_items" do
  it "returns a collection of associated invoice_items" do
    invoice_item = create(:invoice_item)
    invoice_item2 = create(:invoice_item)
    invoice = invoice_item.invoice
    invoice2 = invoice_item2.invoice


    get "/api/v1/invoices/#{invoice.id}/invoice_items"

    expect(json_body[0]).to eq({
      "id" => invoice_item.id,
      "quantity" => 25,
      "unit_price" => "10.0",
      "invoice_id" => invoice.id,
      "item_id" => invoice_item.item_id
      })
  end
end


describe "GET /api/v1/invoices/:id/items" do
  it "returns a collection of associated items" do
    invoice_item = create(:invoice_item)
    invoice_item2 = create(:invoice_item)
    invoice = invoice_item.invoice
    invoice2 = invoice_item2.invoice
    item = invoice_item.item
    item2 = invoice_item2.item



    get "/api/v1/invoices/#{invoice.id}/items"

      expect(json_body[0]).to eq({
        "id" => item.id,
        "name" => item.name,
        "unit_price" => "10.0",
        "description" => item.description,
        "merchant_id" => item.merchant_id
      })
  end
end

describe "GET /api/v1/invoices/:id/customer" do
  it "returns the associated customer" do
    invoice = create(:invoice)
    customer = invoice.customer

    get "/api/v1/invoices/#{invoice.id}/customer"

    expect(json_body).to eq({
      "id" => customer.id,
      "first_name" => customer.first_name,
      "last_name" => customer.last_name
      })

  end
end

describe "GET /api/v1/invoices/:id/merchant" do
  it "returns the associated merchant" do
    invoice = create(:invoice)
    merchant = invoice.merchant

    get "/api/v1/invoices/#{invoice.id}/merchant"

    expect(json_body).to eq({
      "id" => merchant.id,
      "name" => merchant.name
      })

  end
end
