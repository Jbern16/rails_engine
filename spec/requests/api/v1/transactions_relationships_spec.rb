describe "GET /api/v1/transactions/:id/invoice" do
  it "returns the associated invoices" do
    transaction = create(:transaction)
    invoice = transaction.invoice

    get "/api/v1/transactions/#{transaction.id}/invoice"

    expect(json_body).to eq({
      "id" => invoice.id,
      "status" => "shipped",
      "merchant_id" => invoice.merchant_id,
      "customer_id" => invoice.customer_id
    })
  end
end
