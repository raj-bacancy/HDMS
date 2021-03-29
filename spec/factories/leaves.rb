FactoryBot.define do
  factory :leave, class: 'Leave' do
    status {"Pending"}
    subject {"abc"}
    reason {"xyz"}
    date_from {Date.today}
    date_to {Date.today}
  end
end
