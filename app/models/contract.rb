class Contract < ApplicationRecord
  state_machine initial: :draft do
    event :sign do
      transition draft: :signed, if: ->(contract) { contract.text && !contract.text.blank? }
    end

    event :approve_by_manager do
      transition any - :burned => :completed
    end

    event :burn do
      transition any => :burned
    end

    after_transition on: :complete, do: :notify_people
  end

  private

  def notify_people(transition)
    puts 'notified'
    puts transition_args(transition)
  end

  def transition_args(transition)
    if !transition.args.empty? && transition.args[0]&.is_a?(Hash)
      transition.args[0]
    else
      {}
    end
  end
end
