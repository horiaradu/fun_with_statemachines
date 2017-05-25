require 'rails_helper'

RSpec.describe Contract, type: :model do
  let(:contract) { create(:contract) }
  let!(:a_guy) { create(:guy, contract: contract) }
  let!(:another_guy) { create(:guy, contract: contract) }
  let!(:a_manager) { create(:manager, contract: contract) }

  it 'initially, the contract is a draft' do
    expect(contract.state).to eq('draft')
    expect(contract.draft?).to be_truthy

    expect(contract.people.size).to eq(3)
  end

  it 'a guy signing a contract is not enough' do
    a_guy.sign_contract
    expect(contract.draft?).to be_truthy
  end

  it 'if both guys sign it, then it is done' do
    a_guy.sign_contract
    expect(contract.draft?).to be_truthy
    another_guy.sign_contract
    expect(contract.signed?).to be_truthy
  end

  it 'if the manager signs it, then that is also ok' do
    a_manager.sign_contract
    expect(contract.signed?).to be_truthy
  end
end
