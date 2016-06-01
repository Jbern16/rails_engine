require 'rails_helper'

describe "GET /api/v1/transactions.json" do
  before :each do
    @transaction_1 = create(:transaction)
    @transaction_2 = create(:transaction)
  end

  it "returns a list of all transactions with id, invoice_id, credit_card_number, credit_card_expiration_date, result, created_at, updated_at" do

    get "/api/v1/transactions.json"

    expect(json_body.count).to eq 2

    expect(json_body[0]).to eq({
      "id" => @transaction_1.id,
      "credit_card_number" => @transaction_1.credit_card_number,
      "credit_card_expiration_date" => @transaction_1.credit_card_expiration_date,
      "result" => "success",
      "created_at" => parse_time(@transaction_1.created_at),
      "updated_at" => parse_time(@transaction_1.updated_at)
      })
  end
end


describe "GET /api/v1/transactions/:id.json" do
  before :each do
    @transaction_1 = create(:transaction)
    @transaction_2 = create(:transaction)
  end
  it "returns a the transaction with the id of 1" do

     get "/api/v1/transactions/#{@transaction_1.id}.json"

     expect(json_body).to eq({
       "id" => @transaction_1.id,
       "credit_card_number" => @transaction_1.credit_card_number,
       "credit_card_expiration_date" => @transaction_1.credit_card_expiration_date,
       "result" => "success",
       "created_at" => parse_time(@transaction_1.created_at),
       "updated_at" => parse_time(@transaction_1.updated_at)
       })
  end
end

describe "GET /api/v1/transactions/find?parameters" do
  before :each do
    @transaction_1 = create(:transaction)
    @transaction_2 = create(:transaction)
  end
  it "returns the transaction with id of 1" do

     get "/api/v1/transactions/find?id=#{@transaction_1.id}"

     expect(json_body).to eq({
       "id" => @transaction_1.id,
       "credit_card_number" => @transaction_1.credit_card_number,
       "credit_card_expiration_date" => @transaction_1.credit_card_expiration_date,
       "result" => "success",
       "created_at" => parse_time(@transaction_1.created_at),
       "updated_at" => parse_time(@transaction_1.updated_at)
       })
  end


  it "returns the transaction with transaction_id of 1" do

     get "/api/v1/transactions/find?transaction_id=#{@transaction_1.transaction_id}"

     expect(json_body).to eq({
       "id" => @transaction_1.id,
       "credit_card_number" => @transaction_1.credit_card_number,
       "credit_card_expiration_date" => @transaction_1.credit_card_expiration_date,
       "result" => "success",
       "created_at" => parse_time(@transaction_1.created_at),
       "updated_at" => parse_time(@transaction_1.updated_at)
       })
  end


    it "returns the transaction with invoice_id of 1" do

       get "/api/v1/transactions/find?invoice_id=#{@transaction_1.invoice_id}"

       expect(json_body).to eq({
         "id" => @transaction_1.id,
         "credit_card_number" => @transaction_1.credit_card_number,
         "credit_card_expiration_date" => @transaction_1.credit_card_expiration_date,
         "result" => "success",
         "created_at" => parse_time(@transaction_1.created_at),
         "updated_at" => parse_time(@transaction_1.updated_at)
         })
    end


  it "returns the transaction with the credit_card_number of 1000" do

    get "/api/v1/transactions/find?credit_card_number=1000"

     expect(json_body).to eq({
       "id" => @transaction_1.id,
       "credit_card_number" => @transaction_1.credit_card_number,
       "credit_card_expiration_date" => @transaction_1.credit_card_expiration_date,
       "result" => "success",
       "created_at" => parse_time(@transaction_1.created_at),
       "updated_at" => parse_time(@transaction_1.updated_at)
       })
    end

    it "returns the transaction with the quantity of 25" do

      get "/api/v1/transactions/find?quantity=25"

       expect(json_body).to eq({
         "id" => @transaction_1.id,
         "credit_card_number" => @transaction_1.credit_card_number,
         "credit_card_expiration_date" => @transaction_1.credit_card_expiration_date,
         "result" => "success",
         "created_at" => parse_time(@transaction_1.created_at),
         "updated_at" => parse_time(@transaction_1.updated_at)
         })
      end

  xit "returns the transaction with the same created_at" do

     get "/api/v1/transactions/find?created_at=#{@transaction_1.created_at.to_s}"

     expect(json_body).to eq({
       "id" => @transaction_1.id,
       "credit_card_number" => @transaction_1.credit_card_number,
       "credit_card_expiration_date" => @transaction_1.credit_card_expiration_date,
       "result" => "success",
       "created_at" => parse_time(@transaction_1.created_at),
       "updated_at" => parse_time(@transaction_1.updated_at)
       })
  end

  xit "returns the transaction with the same updated_at" do

     get "/api/v1/transactions/find?updated_at=#{@transaction_1.updated_at}"

     expect(json_body).to eq({
       "id" => @transaction_1.id,
       "credit_card_number" => @transaction_1.credit_card_number,
       "credit_card_expiration_date" => @transaction_1.credit_card_expiration_date,
       "result" => "success",
       "created_at" => parse_time(@transaction_1.created_at),
       "updated_at" => parse_time(@transaction_1.updated_at)
       })
  end
end


describe "GET /api/v1/transactions/find_all?parameters" do
  before :each do
    @transaction_1 = create(:transaction)
    @transaction_2 = create(:transaction)
  end
  it "returns all transactions with id of 1" do

     get "/api/v1/transactions/find_all?id=#{@transaction_1.id}"


     expect(json_body[0]).to eq({
       "id" => @transaction_1.id,
       "credit_card_number" => @transaction_1.credit_card_number,
       "credit_card_expiration_date" => @transaction_1.credit_card_expiration_date,
       "result" => "success",
       "created_at" => parse_time(@transaction_1.created_at),
       "updated_at" => parse_time(@transaction_1.updated_at)
       })
  end

  it "returns the all transaction with credit_card_number of 1000" do

     get "/api/v1/transactions/find_all?credit_card_number=1000"

     expect(json_body[0]).to eq({
       "id" => @transaction_1.id,
       "credit_card_number" => @transaction_1.credit_card_number,
       "credit_card_expiration_date" => @transaction_1.credit_card_expiration_date,
       "result" => "success",
       "created_at" => parse_time(@transaction_1.created_at),
       "updated_at" => parse_time(@transaction_1.updated_at)
      })

     expect(json_body[1]).to eq({
       "id" => @transaction_2.id,
       "credit_card_number" => @transaction_1.credit_card_number,
       "credit_card_expiration_date" => @transaction_1.credit_card_expiration_date,
       "result" => "success",
       "created_at" => parse_time(@transaction_2.created_at),
       "updated_at" => parse_time(@transaction_2.updated_at)
      })
  end


  it "returns the all transaction with quantity of 25" do

     get "/api/v1/transactions/find_all?quantity=25"

     expect(json_body[0]).to eq({
       "id" => @transaction_1.id,
       "credit_card_number" => @transaction_1.credit_card_number,
       "credit_card_expiration_date" => @transaction_1.credit_card_expiration_date,
       "result" => "success",
       "created_at" => parse_time(@transaction_1.created_at),
       "updated_at" => parse_time(@transaction_1.updated_at)
      })

     expect(json_body[1]).to eq({
       "id" => @transaction_2.id,
       "credit_card_number" => @transaction_1.credit_card_number,
       "credit_card_expiration_date" => @transaction_1.credit_card_expiration_date,
       "result" => "success",
       "created_at" => parse_time(@transaction_2.created_at),
       "updated_at" => parse_time(@transaction_2.updated_at)
      })
  end

  xit "returns all transactions with the same created_at" do

     get "/api/v1/transactions/find_all?created_at=#{@transaction_1.created_at.to_s}"

     expect(json_body[0]).to eq({
       "id" => @transaction_1.id,
       "credit_card_number" => @transaction_1.credit_card_number,
       "credit_card_expiration_date" => @transaction_1.credit_card_expiration_date,
       "result" => "success",
       "created_at" => parse_time(@transaction_1.created_at),
       "updated_at" => parse_time(@transaction_1.updated_at)
       })
  end

  xit "returns all transactions with the same updated_at" do

     get "/api/v1/transactions/find_all?updated_at=#{@transaction_1.updated_at}"

     expect(json_body[0]).to eq({
       "id" => @transaction_1.id,
       "credit_card_number" => @transaction_1.credit_card_number,
       "credit_card_expiration_date" => @transaction_1.credit_card_expiration_date,
       "result" => "success",
       "created_at" => parse_time(@transaction_1.created_at),
       "updated_at" => parse_time(@transaction_1.updated_at)
       })
  end
end

describe "GET /api/v1/transactions/random" do
  before :each do
    @transaction_1 = create(:transaction)
    @transaction_2 = create(:transaction)
  end
  it "returns a random transaction" do

  get "/api/v1/transactions/random.json"

  id = json_body["id"]

  random_transaction =  Transaction.find(id)

  expect(random_transaction).to respond_to(:id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result, :updated_at)
  end
end
