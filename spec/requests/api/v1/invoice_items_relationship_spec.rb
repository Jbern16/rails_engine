describe "GET /api/v1/invoice_items/:id/invoice" do
  it "returns the associated invoice" do
    invoice_item = create(:invoice_item)
    invoice = invoice_item.invoice

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    expect(json_body).to eq({
      "id" => invoice.id,
      "status" => "shipped",
      "merchant_id" => invoice.merchant_id,
      "customer_id" => invoice.customer_id
      })
  end
end


describe "GET /api/v1/invoice_items/:id/item" do
  it "returns the associated invoice" do
    invoice_item = create(:invoice_item)
    item = invoice_item.item

    get "/api/v1/invoice_items/#{invoice_item.id}/item"

    expect(json_body).to eq({
      "id" => item.id,
      "name" => item.name,
      "unit_price" => "10.0",
      "description" => item.description,
      "merchant_id" => item.merchant_id
    })
  end
end
