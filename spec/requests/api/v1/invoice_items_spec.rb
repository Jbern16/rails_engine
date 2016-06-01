require 'rails_helper'

describe "GET /api/v1/invoice_items.json" do
  before :each do
    @invoice_item_1 = create(:invoice_item)
    @invoice_item_2 = create(:invoice_item)
  end

  it "returns a list of all invoice_items with quantity, unit_price, item_id, invoice_id created_at, updated_at" do

    get "/api/v1/invoice_items.json"

    expect(json_body.count).to eq 2

    expect(json_body[0]).to eq({
      "id" => @invoice_item_1.id,
      "quantity" => 25,
      "unit_price" => "10.0",
      "invoice_id" => @invoice_item_1.invoice_id,
      "item_id" => @invoice_item_1.item_id
      })
  end
end


describe "GET /api/v1/invoice_items/:id.json" do
  before :each do
    @invoice_item_1 = create(:invoice_item)
    @invoice_item_2 = create(:invoice_item)
  end
  it "returns a the invoice with the id of 1" do

     get "/api/v1/invoice_items/#{@invoice_item_1.id}.json"

     expect(json_body).to eq({
       "id" => @invoice_item_1.id,
       "quantity" => 25,
       "unit_price" => "10.0",
       "invoice_id" => @invoice_item_1.invoice_id,
       "item_id" => @invoice_item_1.item_id
       })
  end
end

describe "GET /api/v1/invoice_items/find?parameters" do
  before :each do
    @invoice_item_1 = create(:invoice_item)
    @invoice_item_2 = create(:invoice_item)
  end
  it "returns the invoice with id of 1" do

     get "/api/v1/invoice_items/find?id=#{@invoice_item_1.id}"

     expect(json_body).to eq({
       "id" => @invoice_item_1.id,
       "quantity" => 25,
       "unit_price" => "10.0",
       "invoice_id" => @invoice_item_1.invoice_id,
       "item_id" => @invoice_item_1.item_id
       })
  end


  it "returns the invoice with invoice_id of 1" do

     get "/api/v1/invoice_items/find?invoice_id=#{@invoice_item_1.invoice_id}"

     expect(json_body).to eq({
       "id" => @invoice_item_1.id,
       "quantity" => 25,
       "unit_price" => "10.0",
       "invoice_id" => @invoice_item_1.invoice_id,
       "item_id" => @invoice_item_1.item_id
       })
  end


    it "returns the invoice with item_id of 1" do

       get "/api/v1/invoice_items/find?item_id=#{@invoice_item_1.item_id}"

       expect(json_body).to eq({
         "id" => @invoice_item_1.id,
         "quantity" => 25,
         "unit_price" => "10.0",
         "invoice_id" => @invoice_item_1.invoice_id,
         "item_id" => @invoice_item_1.item_id
         })
    end


  it "returns the invoice with the unit_price of 10" do

    get "/api/v1/invoice_items/find?unit_price=10"

     expect(json_body).to eq({
       "id" => @invoice_item_1.id,
       "quantity" => 25,
       "unit_price" => "10.0",
       "invoice_id" => @invoice_item_1.invoice_id,
       "item_id" => @invoice_item_1.item_id
       })
    end

    it "returns the invoice with the quantity of 25" do

      get "/api/v1/invoice_items/find?quantity=25"

       expect(json_body).to eq({
         "id" => @invoice_item_1.id,
         "quantity" => 25,
         "unit_price" => "10.0",
         "invoice_id" => @invoice_item_1.invoice_id,
         "item_id" => @invoice_item_1.item_id
         })
      end

  xit "returns the invoice with the same created_at" do

     get "/api/v1/invoice_items/find?created_at=#{@invoice_item_1.created_at.to_s}"

     expect(json_body).to eq({
       "id" => @invoice_item_1.id,
       "quantity" => 25,
       "unit_price" => "10.0",
       "invoice_id" => @invoice_item_1.invoice_id,
       "item_id" => @invoice_item_1.item_id
       })
  end

  xit "returns the invoice with the same updated_at" do

     get "/api/v1/invoice_items/find?updated_at=#{@invoice_item_1.updated_at}"

     expect(json_body).to eq({
       "id" => @invoice_item_1.id,
       "quantity" => 25,
       "unit_price" => "10.0",
       "invoice_id" => @invoice_item_1.invoice_id,
       "item_id" => @invoice_item_1.item_id
       })
  end
end


describe "GET /api/v1/invoice_items/find_all?parameters" do
  before :each do
    @invoice_item_1 = create(:invoice_item)
    @invoice_item_2 = create(:invoice_item)
  end
  it "returns all invoice_items with id of 1" do

     get "/api/v1/invoice_items/find_all?id=#{@invoice_item_1.id}"


     expect(json_body[0]).to eq({
       "id" => @invoice_item_1.id,
       "quantity" => 25,
       "unit_price" => "10.0",
       "invoice_id" => @invoice_item_1.invoice_id,
       "item_id" => @invoice_item_1.item_id
       })
  end

  it "returns the all invoice with unit_price of 10" do

   get "/api/v1/invoice_items/find_all?unit_price=10"
     expect(json_body[0]).to eq({
       "id" => @invoice_item_1.id,
       "quantity" => 25,
       "unit_price" => "10.0",
       "invoice_id" => @invoice_item_1.invoice_id,
       "item_id" => @invoice_item_1.item_id
      })

     expect(json_body[1]).to eq({
       "id" => @invoice_item_2.id,
       "quantity" => 25,
       "unit_price" => "10.0",
       "invoice_id" => @invoice_item_2.invoice_id,
       "item_id" => @invoice_item_2.item_id
      })
  end


  it "returns the all invoice with quantity of 25" do

     get "/api/v1/invoice_items/find_all?quantity=25"

     expect(json_body[0]).to eq({
       "id" => @invoice_item_1.id,
       "quantity" => 25,
       "unit_price" => "10.0",
       "invoice_id" => @invoice_item_1.invoice_id,
       "item_id" => @invoice_item_1.item_id
      })

     expect(json_body[1]).to eq({
       "id" => @invoice_item_2.id,
       "quantity" => 25,
       "unit_price" => "10.0",
       "invoice_id" => @invoice_item_2.invoice_id,
       "item_id" => @invoice_item_2.item_id
      })
  end

  xit "returns all invoice_items with the same created_at" do

     get "/api/v1/invoice_items/find_all?created_at=#{@invoice_item_1.created_at.to_s}"

     expect(json_body[0]).to eq({
       "id" => @invoice_item_1.id,
       "quantity" => 25,
       "unit_price" => "10.0",
       "invoice_id" => @invoice_item_1.invoice_id,
       "item_id" => @invoice_item_1.item_id
       })
  end

  xit "returns all invoice_items with the same updated_at" do

     get "/api/v1/invoice_items/find_all?updated_at=#{@invoice_item_1.updated_at}"

     expect(json_body[0]).to eq({
       "id" => @invoice_item_1.id,
       "quantity" => 25,
       "unit_price" => "10.0",
       "invoice_id" => @invoice_item_1.invoice_id,
       "item_id" => @invoice_item_1.item_id
       })
  end
end

describe "GET /api/v1/invoice_items/random" do
  before :each do
    @invoice_item_1 = create(:invoice_item)
    @invoice_item_2 = create(:invoice_item)
  end
  it "returns a random invoice" do

  get "/api/v1/invoice_items/random.json"

  id = json_body["id"]

  random_invoice =  InvoiceItem.find(id)

  expect(random_invoice).to respond_to(:id, :unit_price, :item_id, :invoice_id, :updated_at)
  end
end
