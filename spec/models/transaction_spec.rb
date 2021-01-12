require 'rails_helper'

RSpec.describe Transaction, type: :model do
  subject do
    described_class.new(
      store: FactoryBot.create(:store),
      kind: 'credit',
      transaction_date: Date.parse('2021-01-11'),
      transaction_time: Time.zone.parse('20:24:35'),
      social_number: '02669896575',
      card_number: '5537****8547',
      amount: BigDecimal('25.00')
    )
  end

  it 'is valid with attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without store' do
    subject.store = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without kind' do
    subject.kind = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without transaction_date' do
    subject.transaction_date = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without transaction_time' do
    subject.transaction_time = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without social_number' do
    subject.social_number = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without card_number' do
    subject.card_number = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without amount' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  describe 'ownership' do
    subject { described_class.new }

    it { is_expected.to belong_to(:store) }
  end


end
