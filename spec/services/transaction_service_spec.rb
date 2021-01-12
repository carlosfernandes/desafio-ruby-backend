require 'rails_helper'

RSpec.describe TransactionService do
  describe '.execute' do
    context 'single processing' do

      it 'imports one transaction' do
        TransactionService.execute(File.new(Rails.root.join('spec/fixtures/CNAB-single.txt')))
        expect(Transaction.count).to eq(1)
        expect(Store.count).to eq(1)

        expect(Transaction.last).to have_attributes({
          store: Store.last,
          kind: 3,
          transaction_date: Date.parse('2019-03-01'),
          amount: BigDecimal('142.00'),
          social_number: '09620676017',
          card_number: '4753****3153'
        })

        allow(Transaction.last.transaction_time).to receive(:strftime).with('%H:%M:%S').and_return('15:34:53')
      end
    end

    context 'batch processing' do

      it 'imports multiple transactions' do
        TransactionService.execute(File.new(Rails.root.join('spec/fixtures/CNAB.txt')))

        expect(Transaction.count).to eq(21)
        expect(Store.count).to eq(5)
      end
    end
  end
end
