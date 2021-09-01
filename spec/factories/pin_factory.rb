FactoryBot.define do
  factory :pin, class: Pin do
    pin_id { 1 }
    user_id { 1 }
    name {'Test'}
    description {'test desc'}
  end
end