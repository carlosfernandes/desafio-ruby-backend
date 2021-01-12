class TransactionType
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
      loan_discharge: :+,
      sale: :+,
      income_ted: :+,
      income_doc: :+,
      rent: :-
    }.with_indifferent_access.fetch(kinds)
  end
end
