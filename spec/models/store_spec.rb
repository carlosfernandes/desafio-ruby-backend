require 'rails_helper'

RSpec.describe Store, type: :model do
  subject { described_class.new(name: "FooBar") }

  it 'is valid with attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a empty name' do
    subject.name = ""
    expect(subject).to_not be_valid
  end
end
