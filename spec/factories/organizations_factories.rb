FactoryBot.define do
  factory :organization do
    sequence(:ext_id) { |i| i }
    sequence(:name) { |i| "Company #{i}" }
  end
end
