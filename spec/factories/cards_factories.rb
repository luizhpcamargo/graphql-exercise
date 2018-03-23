FactoryBot.define do
  factory :card do
    sequence(:ext_id) { |i| i }
    sequence(:name) { |i| "Cardname #{i}" }
    phase
    due_date 1.day.since
  end
end
