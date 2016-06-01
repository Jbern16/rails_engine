require 'rails_helper'

describe "GET /api/v1/items.json" do

  before :each do
    @item_1 = create(:item, name: "tool")
    @item_2 = create(:item)
  end

  it "returns a list of all items with name, id, unit_price, merchant_id, created_at, updated_at" do

    get "/api/v1/items.json"

    expect(json_body.count).to eq 2

    expect(json_body[0]).to eq({
      "id" => @item_1.id,
      "name" => "tool",
      "unit_price" => "10.0",
      "description" => @item_1.description,
      "merchant_id" => @item_1.merchant_id
    })

  end
end

describe "GET /api/v1/items/:id.json" do
  before :each do
    @item_1 = create(:item, name: "tool")
    @item_2 = create(:item)
  end
  it "returns a the item with the id of 1" do

     get "/api/v1/items/#{@item_1.id}.json"

     expect(json_body).to eq({
       "id" => @item_1.id,
       "name" => "tool",
       "unit_price" => "10.0",
       "description" => @item_1.description,
       "merchant_id" => @item_1.merchant_id
       })
  end
end

describe "GET /api/v1/items/find?parameters" do
  before :each do
    @item_1 = create(:item, name: "tool")
    @item_2 = create(:item)
  end

  it "returns the item with id of 1" do

     get "/api/v1/items/find?id=#{@item_1.id}"

     expect(json_body).to eq({
       "id" => @item_1.id,
       "name" => "tool",
       "unit_price" => "10.0",
       "description" => @item_1.description,
       "merchant_id" => @item_1.merchant_id
       })
  end


  it "returns the item with the name of tool" do

     get "/api/v1/items/find?name=tool"
      expect(json_body).to eq({
       "id" => @item_1.id,
       "name" => "tool",
       "unit_price" => "10.0",
       "description" => @item_1.description,
       "merchant_id" => @item_1.merchant_id
       })
  end


  it "returns the item with the unit_price of 10" do

    get "/api/v1/items/find?unit_price=10"

     expect(json_body).to eq({
       "id" => @item_1.id,
       "name" => "tool",
       "unit_price" => "10.0",
       "description" => @item_1.description,
       "merchant_id" => @item_1.merchant_id
       })
  end

  xit "returns the item with the same created_at" do

     get "/api/v1/items/find?created_at=#{@item_1.created_at.to_s}"

     expect(json_body).to eq({
       "id" => @item_1.id,
       "name" => "tool",
       "unit_price" => "10.0",
       "description" => @item_1.description,
       "merchant_id" => @item_1.merchant_id
       })
  end

  xit "returns the item with the same updated_at" do

     get "/api/v1/items/find?updated_at=#{@item_1.updated_at}"

     expect(json_body).to eq({
       "id" => @item_1.id,
       "name" => "tool",
       "unit_price" => "10.0",
       "description" => @item_1.description,
       "merchant_id" => @item_1.merchant_id
       })
  end
end


describe "GET /api,/v1/items/find_all?parameters" do
  before :each do
    @item_1 = create(:item, name: "tool")
    @item_2 = create(:item, name: "tool")
  end
  it "returns all items with id of 1" do

     get "/api/v1/items/find_all?id=#{@item_1.id}"


     expect(json_body[0]).to eq({
       "id" => @item_1.id,
       "name" => "tool",
       "unit_price" => "10.0",
       "description" => @item_1.description,
       "merchant_id" => @item_1.merchant_id
       })
  end

  it "returns the all item with the name of Jack" do

     get "/api/v1/items/find_all?name=tool"

      expect(json_body[0]).to eq({
       "id" => @item_1.id,
       "name" => "tool",
       "unit_price" => "10.0",
       "description" => @item_1.description,
       "merchant_id" => @item_1.merchant_id
      })

     expect(json_body[1]).to eq({
       "id" => @item_2.id,
       "name" => "tool",
       "unit_price" => "10.0",
       "description" => @item_2.description,
       "merchant_id" => @item_2.merchant_id
      })
  end


  it "returns the all item with the unit price of 10"do

     get "/api/v1/items/find_all?unit_price=10"

     expect(json_body[0]).to eq({
       "id" => @item_1.id,
       "name" => "tool",
       "unit_price" => "10.0",
       "description" => @item_1.description,
       "merchant_id" => @item_1.merchant_id
      })

     expect(json_body[1]).to eq({
       "id" => @item_2.id,
       "name" => "tool",
       "unit_price" => "10.0",
       "description" => @item_2.description,
       "merchant_id" => @item_2.merchant_id
      })
  end

  xit "returns all items with the same created_at" do

     get "/api/v1/items/find_all?created_at=#{@item_1.created_at.to_s}"

     expect(json_body[0]).to eq({
       "id" => @item_1.id,
       "name" => "tool",
       "unit_price" => "10.0",
       "description" => @item_1.description,
       "merchant_id" => @item_1.merchant_id
       })
  end

  xit "returns all items with the same updated_at" do

     get "/api/v1/items/find_all?updated_at=#{@item_1.updated_at}"

     expect(json_body[0]).to eq({
       "id" => @item_1.id,
       "name" => "tool",
       "unit_price" => "10.0",
       "description" => @item_1.description,
       "merchant_id" => @item_1.merchant_id
       })
  end
end

describe "GET /api/v1/items/random" do
  before :each do
    @item_1 = create(:item, name: "tool")
    @item_2 = create(:item)
  end
  it "returns a random item" do

  get "/api/v1/items/random.json"

  id = json_body["id"]

  random_item =  Item.find(id)

  expect(random_item).to respond_to(:id, :name, :unit_price, :merchant_id)
  end
end
