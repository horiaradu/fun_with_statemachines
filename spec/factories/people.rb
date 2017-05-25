FactoryGirl.define do
  factory :guy, class: Person do
    signed false
    role :guy
    contract { association(:contract) }
  end

  factory :manager, class: Person do
    signed false
    role :manager
    contract { association(:contract) }
  end
end
