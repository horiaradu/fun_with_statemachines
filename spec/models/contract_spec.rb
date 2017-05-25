require 'rails_helper'

RSpec.describe Contract, type: :model do
  let(:contract) { create(:contract) }

  it 'initially, the contract is a draft' do
    expect(contract.state).to eq('draft')
    expect(contract.draft?).to be_truthy
  end

  it 'sign' do
    expect(contract.sign).to be_truthy
    expect(contract.state).to eq('signed')
    expect(contract.signed?).to be_truthy
  end

  describe 'approving' do
    it 'a draft' do
      expect(contract.approve_by_manager).to be_truthy
      expect(contract.state).to eq('completed')
      expect(contract.completed?).to be_truthy
    end

    it 'a signed contract' do
      contract.sign
      expect(contract.approve_by_manager).to be_truthy
      expect(contract.state).to eq('completed')
      expect(contract.completed?).to be_truthy
    end

    it 'a burnt contract' do
      contract.burn
      expect(contract.approve_by_manager).to be_falsey
      expect(contract.state).to eq('burned')
      expect(contract.burned?).to be_truthy
    end
  end

  it 'burning a completed contract' do
    contract.approve_by_manager
    expect(contract.burn).to be_truthy
    expect(contract.state).to eq('burned')
    expect(contract.burned?).to be_truthy
  end
end
