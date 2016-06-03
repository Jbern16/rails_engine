FactoryGirl.define do

  factory :merchant do
    name "merchant-test"
    created_at "2012-03-25 09:54:09 UTC"
    updated_at "2012-03-25 09:54:09 UTC"
  end

  factory :customer do
    first_name "first_test"
    last_name "last_test"
    created_at "2012-03-25 09:54:09 UTC"
    updated_at "	2012-03-25 09:54:09 UTC"
  end

  factory :item do
    name "itemtest"
    description "descriptest"
    unit_price 1000
    merchant
    created_at "2012-03-25 09:54:09 UTC"
    updated_at "2012-03-25 09:54:09 UTC"
  end

  factory :invoice do
    status "shipped"
    customer
    merchant
    created_at "2012-03-25 09:54:09 UTC"
    updated_at "2012-03-25 09:54:09 UTC"
  end

  factory :invoice_item do
    item
    invoice
    quantity 25
    unit_price 1000
    created_at "2012-03-25 09:54:09 UTC"
    updated_at "2012-03-25 09:54:09 UTC"
  end

  factory :transaction do
    invoice
    credit_card_number "4654405418249632"
    credit_card_expiration_date "2016-05-31"
    result "success"
    created_at "2012-03-25 09:54:09 UTC"
    updated_at "2012-03-25 09:54:09 UTC"
  end

end
