require 'rails_helper'

RSpec.describe Rating, type: :model do
  before(:each) do
    @pin = build(:pin)
  end

  context 'association' do
    it 'should belong to a pin' do
      res = Pin.reflect_on_association(:ratings)
      expect(res.macro).to eq(:has_many)
    end
  end

  context 'valid attachment' do
    it 'is attached' do
      expect(@pin.image).to be_attached
    end
  end

  context 'creation' do
    it 'creates a valid rating' do
      rating = Rating.create(pin_id: 1, user_id: 1, rating: 5, pin: @pin)
      expect(rating.valid?).to be(true)
    end

    it 'cannot be higher than max value' do
      rating = Rating.create(pin_id: 1, user_id: 1, rating: 11, pin: @pin)
      expect(rating.valid?).to be(false)
    end

    it 'cannot be lower than max value' do
      rating = Rating.create(pin_id: 1, user_id: 1, rating: -1, pin: @pin)
      expect(rating.valid?).to be(false)
    end
  end
end
