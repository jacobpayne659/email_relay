FactoryBot.define do
  factory :email do
    association :email_group
    subject { "Test Subject" }
    body { "Test Body" }
    deleted_at { nil }
  end
end
