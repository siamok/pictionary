FactoryBot.define do
  factory :user do
    id {1}
    email {'test@test.com'}
    password {'testtest123'}
    password_confirmation {'testtest123'}
    name {'test'}
  end
end