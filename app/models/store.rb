class Store < ApplicationRecord
  has_many :transactions
  validates_presence_of %i[name owner]
end
