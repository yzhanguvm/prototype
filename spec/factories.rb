FactoryGirl.define do
  factory :user do
    name     "Mike Hart"
    email    "mhart@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
