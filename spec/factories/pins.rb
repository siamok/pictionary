FactoryBot.define do
  factory :pin do
    id { 1 }
    user_id { 1 }
    description {'test desc'}

    after(:build) do |pin|
      pin.image.attach(
        io: File.open(Rails.root.join('spec', 'resources', 'test.PNG')),
        filename: 'test.PNG',
        content_type: 'image/png')
    end
  end
end