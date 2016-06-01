FactoryGirl.define do

  factory :merchant do
    name "merchant-test"
  end

  factory :customer do
    first_name "first_test"
    last_name "last_test"
  end

  factory :item do
    name "itemtest"
    description "descriptest"
    unit_price 1000
    merchant
  end

  factory :invoice do
    status "shipped"
    customer
    merchant
  end

  factory :invoice_item do
    item
    invoice
    quantity 25
    unit_price 1000
  end

  factory :transaction do
    invoice
    credit_card_number "4654405418249632"
    credit_card_expiration_date "2016-05-31"
    result "success"
  end


end
