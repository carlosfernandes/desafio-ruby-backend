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

  enum kinds: {
    debit: 1,
    boleto: 2,
    loan: 3,
    credit: 4,
    loan_receipt: 5,
    sale: 6,
    income_ted: 7,
    income_doc: 8,
    rent: 9
  }

  def self.kind_signal(kind)
    {
      debit: :+,
      boleto: :-,
      loan: :-,
      credit: :+,
      loan_receipt: :+,
      sale: :+,
      income_ted: :+,
      income_doc: :+,
      rent: :-
    }.with_indifferent_access.fetch(kind)
  end

  def amount_operation
    amount_kind = Transaction.kinds.key(self.kind)
    amount * "#{Transaction.kind_signal(amount_kind)}1".to_i
  end

  def time_only
    transaction_time.strftime('%H:%M:%S')
  end

end
