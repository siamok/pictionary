FactoryBot.define do
  factory :rating do
    user_id {1}
    pin_id {1}
    rating {6}
    pin { build(:pin) }
  end
end