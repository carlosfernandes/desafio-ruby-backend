FactoryBot.define do
  factory :transaction do
    store
    kind { TransactionType.kinds.keys.sample }
    transaction_date { FFaker::Date.backward }
    transaction_time { FFaker::Time.backward }
    social_number { FFaker::IDNumber.brazilian_citizen_number }
    card_number { FFaker::Finance.credit_card }
    amount { FFaker::Number.decimal(r_digits: 2) }
  end
end
