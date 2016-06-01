require 'rails_helper'

describe "GET /api/v1/invoices.json" do
  before :each do
    @invoice_1 = create(:invoice)
    @invoice_2 = create(:invoice)
  end

  it "returns a list of all invoices with status, customer_id, merchant_id, created_at, updated_at" do

    get "/api/v1/invoices.json"

    expect(json_body.count).to eq 2

    expect(json_body[0]).to eq({
      "id" => @invoice_1.id,
      "status" => "shipped",
      "merchant_id" => @invoice_1.merchant_id,
      "customer_id" => @invoice_1.customer_id,
      "created_at" => parse_time(@invoice_1.created_at),
      "updated_at" => parse_time(@invoice_1.updated_at)
      })
  end
end


describe "GET /api/v1/invoices/:id.json" do
  before :each do
    @invoice_1 = create(:invoice)
    @invoice_2 = create(:invoice)
  end
  it "returns a the invoice with the id of 1" do

     get "/api/v1/invoices/#{@invoice_1.id}.json"

     expect(json_body).to eq({
       "id" => @invoice_1.id,
       "status" => "shipped",
       "merchant_id" => @invoice_1.merchant_id,
       "customer_id" => @invoice_1.customer_id,
       "created_at" => parse_time(@invoice_1.created_at),
       "updated_at" => parse_time(@invoice_1.updated_at)
       })
  end
end

describe "GET /api/v1/invoices/find?parameters" do
  before :each do
    @invoice_1 = create(:invoice)
    @invoice_2 = create(:invoice)
  end
  it "returns the invoice with id of 1" do

     get "/api/v1/invoices/find?id=#{@invoice_1.id}"

     expect(json_body).to eq({
       "id" => @invoice_1.id,
       "status" => "shipped",
       "merchant_id" => @invoice_1.merchant_id,
       "customer_id" => @invoice_1.customer_id,
       "created_at" => parse_time(@invoice_1.created_at),
       "updated_at" => parse_time(@invoice_1.updated_at)
       })
  end


  it "returns the invoice with customer_id of 1" do

     get "/api/v1/invoices/find?customer_id=#{@invoice_1.customer_id}"

     expect(json_body).to eq({
       "id" => @invoice_1.id,
       "status" => "shipped",
       "merchant_id" => @invoice_1.merchant_id,
       "customer_id" => @invoice_1.customer_id,
       "created_at" => parse_time(@invoice_1.created_at),
       "updated_at" => parse_time(@invoice_1.updated_at)
       })
  end


    it "returns the invoice with mechant_id of 1" do

       get "/api/v1/invoices/find?merchant_id=#{@invoice_1.merchant_id}"

       expect(json_body).to eq({
         "id" => @invoice_1.id,
         "status" => "shipped",
         "merchant_id" => @invoice_1.merchant_id,
         "customer_id" => @invoice_1.customer_id,
         "created_at" => parse_time(@invoice_1.created_at),
         "updated_at" => parse_time(@invoice_1.updated_at)
         })
    end


  it "returns the invoice with the status of shipped" do

    get "/api/v1/invoices/find?status=shipped"

     expect(json_body).to eq({
       "id" => @invoice_1.id,
       "status" => "shipped",
       "merchant_id" => @invoice_1.merchant_id,
       "customer_id" => @invoice_1.customer_id,
       "created_at" => parse_time(@invoice_1.created_at),
       "updated_at" => parse_time(@invoice_1.updated_at)
       })
    end

  xit "returns the invoice with the same created_at" do

     get "/api/v1/invoices/find?created_at=#{@invoice_1.created_at.to_s}"

     expect(json_body).to eq({
       "id" => @invoice_1.id,
       "status" => "shipped",
       "merchant_id" => @invoice_1.merchant_id,
       "customer_id" => @invoice_1.customer_id,
       "created_at" => parse_time(@invoice_1.created_at),
       "updated_at" => parse_time(@invoice_1.updated_at)
       })
  end

  xit "returns the invoice with the same updated_at" do

     get "/api/v1/invoices/find?updated_at=#{@invoice_1.updated_at}"

     expect(json_body).to eq({
       "id" => @invoice_1.id,
       "status" => "shipped",
       "merchant_id" => @invoice_1.merchant_id,
       "customer_id" => @invoice_1.customer_id,
       "created_at" => parse_time(@invoice_1.created_at),
       "updated_at" => parse_time(@invoice_1.updated_at)
       })
  end
end


describe "GET /api/v1/invoices/find_all?parameters" do
  before :each do
    @invoice_1 = create(:invoice)
    @invoice_2 = create(:invoice)
  end
  it "returns all invoices with id of 1" do

     get "/api/v1/invoices/find_all?id=#{@invoice_1.id}"


     expect(json_body[0]).to eq({
       "id" => @invoice_1.id,
       "status" => "shipped",
       "merchant_id" => @invoice_1.merchant_id,
       "customer_id" => @invoice_1.customer_id,
       "created_at" => parse_time(@invoice_1.created_at),
       "updated_at" => parse_time(@invoice_1.updated_at)
       })
  end

  it "returns the all invoice with status of shipped" do

     get "/api/v1/invoices/find_all?status=shipped"

     expect(json_body[0]).to eq({
       "id" => @invoice_1.id,
       "status" => "shipped",
       "merchant_id" => @invoice_1.merchant_id,
       "customer_id" => @invoice_1.customer_id,
       "created_at" => parse_time(@invoice_1.created_at),
       "updated_at" => parse_time(@invoice_1.updated_at)
      })

     expect(json_body[1]).to eq({
       "id" => @invoice_2.id,
       "status" => "shipped",
       "merchant_id" => @invoice_2.merchant_id,
       "customer_id" => @invoice_2.customer_id,
       "created_at" => parse_time(@invoice_2.created_at),
       "updated_at" => parse_time(@invoice_2.updated_at)
      })
  end

  xit "returns all invoices with the same created_at" do

     get "/api/v1/invoices/find_all?created_at=#{@invoice_1.created_at.to_s}"

     expect(json_body[0]).to eq({
       "id" => @invoice_1.id,
       "status" => "shipped",
       "merchant_id" => @invoice_1.merchant_id,
       "customer_id" => @invoice_1.customer_id,
       "created_at" => parse_time(@invoice_1.created_at),
       "updated_at" => parse_time(@invoice_1.updated_at)
       })
  end

  xit "returns all invoices with the same updated_at" do

     get "/api/v1/invoices/find_all?updated_at=#{@invoice_1.updated_at}"

     expect(json_body[0]).to eq({
       "id" => @invoice_1.id,
       "status" => "shipped",
       "merchant_id" => @invoice_1.merchant_id,
       "customer_id" => @invoice_1.customer_id,
       "created_at" => parse_time(@invoice_1.created_at),
       "updated_at" => parse_time(@invoice_1.updated_at)
       })
  end
end

describe "GET /api/v1/invoices/random" do
  before :each do
    @invoice_1 = create(:invoice)
    @invoice_2 = create(:invoice)
  end
  it "returns a random invoice" do

  get "/api/v1/invoices/random.json"

  id = json_body["id"]

  random_invoice =  Invoice.find(id)

  expect(random_invoice).to respond_to(:id, :status, :merchant_id, :customer_id, :updated_at)
  end
end
