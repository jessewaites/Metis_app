FactoryGirl.define do
  factory :user do
    name "Jesse"
    cell_number "8675309"
    github_username "fake_account"
    password "12345678"
    sequence(:email) { |n| "Jesse#{n}@factory.com"}
  end
end
