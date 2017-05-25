class Person < ApplicationRecord
  belongs_to :contract

  enum role: [:guy, :manager]

  def sign_contract
    update(signed: true)
    contract.sign
  end
end
