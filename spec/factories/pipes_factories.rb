FactoryBot.define do
  factory :pipe do
    sequence(:name) { |i| "Task #{i}" }
    organization
  end
end
