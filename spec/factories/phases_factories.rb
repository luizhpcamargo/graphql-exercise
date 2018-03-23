FactoryBot.define do
  factory :phase do
    sequence(:name) { |i| "Number #{i}" }
    pipe
  end
end
