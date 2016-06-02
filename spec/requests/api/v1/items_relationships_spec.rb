require 'rails_helper'

describe "GET /api/v1/items/:id/invoice_items" do
  it "returns a collection of associated invoice_items" do
    invoice_item = create(:invoice_item)
    item = invoice_item.item

    get "/api/v1/items/#{item.id}/invoice_items"


    expect(json_body[0]).to eq({
      "id" => invoice_item.id,
      "quantity" => 25,
      "unit_price" => "10.0",
      "invoice_id" => invoice_item.invoice_id,
      "item_id" => item.id
      })
  end
end

describe "GET /api/v1/items/:id/merchant" do
  it "returns the associated merchant" do
    item = create(:item)
    merchant = item.merchant

    get "/api/v1/items/#{item.id}/merchant"

    expect(json_body).to eq({
      "id" => merchant.id,
      "name" => merchant.name
      })
  end
end
