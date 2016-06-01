FactoryGirl.define do
  factory :transaction do
    invoice nil
    credit_card_number "MyString"
    credit_card_expiration_date "2016-05-31"
    result "MyString"
  end
end
