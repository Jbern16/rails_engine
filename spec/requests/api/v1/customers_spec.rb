require 'rails_helper'

describe "GET /api/v1/customers.json" do
  before :each do
    @customer_1 = create(:customer, first_name: "Jack", last_name: "Nonce")
    @customer_2 = create(:customer)
  end

  it "returns a list of all customers with name, id, created_at, updated_at" do

    get "/api/v1/customers.json"

    expect(json_body.count).to eq 2

    expect(json_body[0]).to eq({
      "id" => @customer_1.id,
      "first_name" => "Jack",
      "last_name" => "Nonce",
      "created_at" => parse_time(@customer_1.created_at),
      "updated_at" => parse_time(@customer_1.updated_at)
      })

  end
end


describe "GET /api/v1/customers/:id.json" do
  before :each do
    @customer_1 = create(:customer, first_name: "Jack", last_name: "Nonce")
    @customer_2 = create(:customer)
  end
  it "returns a the customer with the id of 1" do

     get "/api/v1/customers/#{@customer_1.id}.json"

     expect(json_body).to eq({
       "id" => @customer_1.id,
       "first_name" => "Jack",
       "last_name" => "Nonce",
       "created_at" => parse_time(@customer_1.created_at),
       "updated_at" => parse_time(@customer_1.updated_at)
       })
  end
end

describe "GET /api/v1/customers/find?parameters" do
  before :each do
    @customer_1 = create(:customer, first_name: "Jack", last_name: "Nonce")
    @customer_2 = create(:customer)
  end
  it "returns the customer with id of 1" do

     get "/api/v1/customers/find?id=#{@customer_1.id}"

     expect(json_body).to eq({
       "id" => @customer_1.id,
       "first_name" => "Jack",
       "last_name" => "Nonce",
       "created_at" => parse_time(@customer_1.created_at),
       "updated_at" => parse_time(@customer_1.updated_at)
       })
  end

  it "returns the customer with the name of Jack" do

     get "/api/v1/customers/find?first_name=Jack"

     expect(json_body).to eq({
       "id" => @customer_1.id,
       "first_name" => "Jack",
       "last_name" => "Nonce",
       "created_at" => parse_time(@customer_1.created_at),
       "updated_at" => parse_time(@customer_1.updated_at)
       })
  end

  it "returns the customer with the first_name of Jack case-insensitive" do

     get "/api/v1/customers/find?first_name=JaCK"

     expect(json_body).to eq({
       "id" => @customer_1.id,
       "first_name" => "Jack",
       "last_name" => "Nonce",
       "created_at" => parse_time(@customer_1.created_at),
       "updated_at" => parse_time(@customer_1.updated_at)
       })
  end


  it "returns the customer with the last_name of Jack" do

    get "/api/v1/customers/find?last_name=Nonce"

     expect(json_body).to eq({
       "id" => @customer_1.id,
       "first_name" => "Jack",
       "last_name" => "Nonce",
       "created_at" => parse_time(@customer_1.created_at),
       "updated_at" => parse_time(@customer_1.updated_at)
       })
    end

  xit "returns the customer with the same created_at" do

     get "/api/v1/customers/find?created_at=#{@customer_1.created_at.to_s}"

     expect(json_body).to eq({
       "id" => @customer_1.id,
       "first_name" => "Jack",
       "last_name" => "Nonce",
       "created_at" => parse_time(@customer_1.created_at),
       "updated_at" => parse_time(@customer_1.updated_at)
       })
  end

  xit "returns the customer with the same updated_at" do

     get "/api/v1/customers/find?updated_at=#{@customer_1.updated_at}"

     expect(json_body).to eq({
       "id" => @customer_1.id,
       "first_name" => "Jack",
       "last_name" => "Nonce",
       "created_at" => parse_time(@customer_1.created_at),
       "updated_at" => parse_time(@customer_1.updated_at)
       })
  end
end


describe "GET /api/v1/customers/find_all?parameters" do
  before :each do
    @customer_1 = create(:customer, first_name: "Jack", last_name: "Nonce")
    @customer_2 = create(:customer, first_name: "Jack", last_name: "Nonce")
  end
  it "returns all customers with id of 1" do

     get "/api/v1/customers/find_all?id=#{@customer_1.id}"


     expect(json_body[0]).to eq({
       "id" => @customer_1.id,
       "first_name" => "Jack",
       "last_name" => "Nonce",
       "created_at" => parse_time(@customer_1.created_at),
       "updated_at" => parse_time(@customer_1.updated_at)
       })
  end

  it "returns the all customer with the name of Jack" do

     get "/api/v1/customers/find_all?first_name=Jack"


     expect(json_body[0]).to eq({
       "id" => @customer_1.id,
       "first_name" => "Jack",
       "last_name" => "Nonce",
       "created_at" => parse_time(@customer_1.created_at),
       "updated_at" => parse_time(@customer_1.updated_at)
      })

     expect(json_body[1]).to eq({
       "id" => @customer_2.id,
       "first_name" => "Jack",
       "last_name" => "Nonce",
       "created_at" => parse_time(@customer_2.created_at),
       "updated_at" => parse_time(@customer_2.updated_at)
      })
  end


  it "returns the all customer with the last_name of Nonce" do

     get "/api/v1/customers/find_all?last_name=Nonce"


     expect(json_body[0]).to eq({
       "id" => @customer_1.id,
       "first_name" => "Jack",
       "last_name" => "Nonce",
       "created_at" => parse_time(@customer_1.created_at),
       "updated_at" => parse_time(@customer_1.updated_at)
      })

     expect(json_body[1]).to eq({
       "id" => @customer_2.id,
       "first_name" => "Jack",
       "last_name" => "Nonce",
       "created_at" => parse_time(@customer_2.created_at),
       "updated_at" => parse_time(@customer_2.updated_at)
      })
  end

  xit "returns all customers with the same created_at" do

     get "/api/v1/customers/find_all?created_at=#{@customer_1.created_at.to_s}"

     expect(json_body[0]).to eq({
       "id" => @customer_1.id,
       "first_name" => "Jack",
       "last_name" => "Nonce",
       "created_at" => parse_time(@customer_1.created_at),
       "updated_at" => parse_time(@customer_1.updated_at)
       })
  end

  xit "returns all customers with the same updated_at" do

     get "/api/v1/customers/find_all?updated_at=#{@customer_1.updated_at}"

     expect(json_body[0]).to eq({
       "id" => @customer_1.id,
       "first_name" => "Jack",
       "last_name" => "Nonce",
       "created_at" => parse_time(@customer_1.created_at),
       "updated_at" => parse_time(@customer_1.updated_at)
       })
  end
end

describe "GET /api/v1/customers/random" do
  before :each do
    @customer_1 = create(:customer, first_name: "Jack", last_name: "Nonce")
    @customer_2 = create(:customer)
  end
  it "returns a random customer" do

  get "/api/v1/customers/random.json"

  id = json_body["id"]

  random_customer =  Customer.find(id)

  expect(random_customer).to respond_to(:id, :first_name, :last_name, :created_at, :updated_at)
  end
end
