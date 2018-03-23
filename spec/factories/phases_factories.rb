FactoryBot.define do
  factory :phase do
    sequence(:ext_id) { |i| i }
    sequence(:name) { |i| "Number #{i}" }
    pipe
  end
end
