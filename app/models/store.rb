class Store < ApplicationRecord
  has_many :transactions
  validates_presence_of %i[name owner]

  def balance
    transactions.reduce(BigDecimal('0')) do |sum, transact|
      sum += transact.amount_operation
    end
  end
end
