require 'rails_helper'

describe 'GET /api/v1/merchants/:id/item' do

  it "it returns a collection of items associated with that merchant" do
    item = create(:item, name: "tool")
    merchant = item.merchant

    get "/api/v1/merchants/#{merchant.id}/items"

    expect(json_body[0]).to eq({
      "id" => item.id,
      "name" => "tool",
      "unit_price" => "10.0",
      "description" => item.description,
      "merchant_id" => merchant.id
    })
  end

  it "returns a collection of invoices associated with that mechant" do
      invoice = create(:invoice)
      merchant = invoice.merchant

      get "/api/v1/merchants/#{merchant.id}/invoices"

      expect(json_body[0]).to eq({
        "id" => invoice.id,
        "status" => "shipped",
        "merchant_id" => merchant.id,
        "customer_id" => invoice.customer_id
        })
  end
end
