FactoryBot.define do
  factory :field do
    sequence(:name) { |i| "Field #{i}" }
    sequence(:content) { |i| "Information #{i}"}
  end
end
