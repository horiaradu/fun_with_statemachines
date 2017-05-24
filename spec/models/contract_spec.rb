require 'rails_helper'

RSpec.describe Contract, type: :model do
  let(:contract) { create(:contract) }

  it 'initially, the contract is a draft' do
    expect(contract.state).to eq('draft')
    expect(contract.draft?).to be_truthy
  end

  it 'transitions to completed' do
    expect(contract.complete).to be_truthy
    expect(contract.state).to eq('completed')
    expect(contract.completed?).to be_truthy
  end

  it 'transitions with arguments' do
    expect(contract.complete(foo: 'bar')).to be_truthy
    expect(contract.state).to eq('completed')
    expect(contract.completed?).to be_truthy
  end

  it "can't transition twice" do
    contract.complete
    expect(contract.complete).to be_falsey
    expect { contract.complete! }.to raise_error(StateMachines::InvalidTransition)
  end
end
