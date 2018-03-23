FactoryBot.define do
  factory :organization do
    sequence(:name) { |i| "Company #{i}" }
  end
end
