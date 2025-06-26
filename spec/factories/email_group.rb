FactoryBot.define do
  factory :email_group do
    sequence(:name) { |n| "Test Group #{n}" }
    sequence(:group_email) { |n| "group#{n}@example.com" }
  end
end
