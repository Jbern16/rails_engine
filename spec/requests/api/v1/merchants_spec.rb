require 'rails_helper'

describe "GET /api/v1/merchants.json" do
  it "returns a list of all merchants with name, id, created_at, updated_at" do

    merchant_1 = create(:merchant, name: "Jack")
    merchant_2 = create(:merchant)

    get "/api/v1/merchants.json"

    expect(json_body.count).to eq 2

    expect(json_body[0]).to eq({
      "id" => merchant_1.id,
      "name" => "Jack"
      })

  end
end


describe "GET /api/v1/merchants/:id.json" do
  it "returns a the merchant with the id of 1" do

    merchant_1 = create(:merchant, name: "Jack")
    merchant_2 = create(:merchant)

     get "/api/v1/merchants/#{merchant_1.id}.json"

     expect(json_body).to eq({
       "id" => merchant_1.id,
       "name" => "Jack"
       })
  end
end

describe "GET /api/v1/merchants/find?parameters" do
  it "returns the merchant with id of 1" do

    merchant_1 = create(:merchant, name: "Jack")
    merchant_2 = create(:merchant)

     get "/api/v1/merchants/find?id=#{merchant_1.id}"

     expect(json_body).to eq({
       "id" => merchant_1.id,
       "name" => "Jack"
       })
  end


  it "returns the merchant with the name of Jack" do
    merchant_1 = create(:merchant, name: "Jack")
    merchant_2 = create(:merchant)

     get "/api/v1/merchants/find?name=Jack"

     expect(json_body).to eq({
       "id" => merchant_1.id,
       "name" => "Jack"
       })
  end

  it "returns the merchant with the name of Jack case-insensitive" do
    merchant_1 = create(:merchant, name: "Jack")
    merchant_2 = create(:merchant)

     get "/api/v1/merchants/find?name=JAcK"

     expect(json_body).to eq({
       "id" => merchant_1.id,
       "name" => "Jack"
       })
  end

  it "returns the merchant with the same created_at" do
    merchant_1 = create(:merchant, name: "Jack")
    merchant_2 = create(:merchant)

     get "/api/v1/merchants/find?created_at=#{merchant_1.created_at.to_s}"

     expect(json_body).to eq({
       "id" => merchant_1.id,
       "name" => "Jack"
       })
  end

  it "returns the merchant with the same updated_at" do
    merchant_1 = create(:merchant, name: "Jack")
    merchant_2 = create(:merchant)

     get "/api/v1/merchants/find?updated_at=#{merchant_1.updated_at}"

     expect(json_body).to eq({
       "id" => merchant_1.id,
       "name" => "Jack"
       })
  end
end


describe "GET /api/v1/merchants/find_all?parameters" do
  it "returns all merchants with id of 1" do

    merchant_1 = create(:merchant, name: "Jack")
    merchant_2 = create(:merchant)

     get "/api/v1/merchants/find_all?id=#{merchant_1.id}"


     expect(json_body[0]).to eq({
       "id" => merchant_1.id,
       "name" => "Jack"
       })
  end

  it "returns the all merchant with the name of Jack" do
    merchant_1 = create(:merchant, name: "Jack")
    merchant_2 = create(:merchant, name: "Jack")

     get "/api/v1/merchants/find_all?name=Jack"


     expect(json_body[0]).to eq({
       "id" => merchant_1.id,
       "name" => "Jack"
      })

     expect(json_body[1]).to eq({
       "id" => merchant_2.id,
       "name" => "Jack",

      })
  end

  it "returns all merchants with the same created_at" do
    merchant_1 = create(:merchant, name: "Jack")
    merchant_2 = create(:merchant)

     get "/api/v1/merchants/find_all?created_at=#{merchant_1.created_at.to_s}"

     expect(json_body[0]).to eq({
       "id" => merchant_1.id,
       "name" => "Jack"
       })
  end

  it "returns all merchants with the same updated_at" do
    merchant_1 = create(:merchant, name: "Jack")
    merchant_2 = create(:merchant)

     get "/api/v1/merchants/find_all?updated_at=#{merchant_1.updated_at}"

     expect(json_body[0]).to eq({
       "id" => merchant_1.id,
       "name" => "Jack"
       })
  end
end
describe "GET /api/v1/merchants/random" do
  it "returns a random merchant" do

  merchant_1 = create(:merchant, name: "Jack")
  merchant_2 = create(:merchant)

  get "/api/v1/merchants/random.json"

  id = json_body["id"]

  random_merchant =  Merchant.find(id)

  expect(random_merchant).to respond_to(:id, :name, :created_at, :updated_at)
  end
end
