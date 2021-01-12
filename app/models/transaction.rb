class Transaction < ApplicationRecord
  belongs_to :store

  validates_presence_of %i[
    store
    kind
    transaction_date
    transaction_time
    social_number
    card_number
    amount
  ]
end
