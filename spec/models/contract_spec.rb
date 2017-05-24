require 'rails_helper'

RSpec.describe Contract, type: :model do
  let(:contract) { create(:contract) }

  it 'initially, the contract is a draft' do
    expect(contract.state).to eq('draft')
    expect(contract.draft?).to be_truthy
  end

  it 'transitions to completed' do
    contract.complete
    expect(contract.state).to eq('completed')
    expect(contract.completed?).to be_truthy
  end

  it 'transitions with arguments' do
    contract.complete(foo: 'bar')
    expect(contract.state).to eq('completed')
    expect(contract.completed?).to be_truthy
  end
end
