class Contract < ApplicationRecord
  state_machine initial: :draft do
    event :complete do
      transition draft: :completed
    end

    after_transition on: :complete, do: :notify_people
  end

  private

  def notify_people
    puts 'notified'
  end
end
