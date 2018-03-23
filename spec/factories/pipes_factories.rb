FactoryBot.define do
  factory :pipe do
    sequence(:ext_id) { |i| i }
    sequence(:name) { |i| "Task #{i}" }
    organization
  end
end
