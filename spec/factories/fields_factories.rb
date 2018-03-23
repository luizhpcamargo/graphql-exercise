FactoryBot.define do
  factory :field do
    sequence(:name) { |i| "Field #{i}" }

    trait :with_content do
      sequence(:content) { |i| "Information #{i}"}
    end
  end
end
