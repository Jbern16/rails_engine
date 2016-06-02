describe "GET /api/v1/customers/:id/invoices" do
  it "returns a collection of associated invoices" do
    invoice = create(:invoice)
    customer = invoice.customer

    get "/api/v1/customers/#{customer.id}/invoices"

    expect(json_body[0]).to eq({
      "id" => invoice.id,
      "status" => "shipped",
      "merchant_id" => invoice.merchant_id,
      "customer_id" => customer.id
      })
  end
end

describe "GET /api/v1/customers/:id/transactions" do
  it "returns a collection of associated transactions" do
     transaction = create(:transaction)
     invoice = transaction.invoice
     customer = invoice.customer

    
    get "/api/v1/customers/#{customer.id}/transactions"

    expect(json_body[0]).to eq({
      "id" => transaction.id,
      "invoice_id" => transaction.invoice_id,
      "credit_card_number" => transaction.credit_card_number,
      "result" => "success"
    })
  end
end
