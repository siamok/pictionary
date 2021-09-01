require 'rails_helper'

RSpec.describe Rating, type: :model do
  context 'association tests' do
    it 'belongs to pins' do
      res = Rating.reflect_on_association(:pin)
      expect(res.macro).to eq(:belongs_to)
    end
  end
  
  context 'ratings funcs' do
    # let(:pin) { double("Pin") } #{ Pin.new({pin_id: 1, user_id: 1})}
    # let(:rating) { Rating.new({ pin_id: 1, user_id: 1, rating: 5 }) }
    # let(:rating_not_valid) { Rating.new({ pin_id: 1, user_id: 1, rating: 15 }) }

    it 'correctly created' do
      rating = Rating.new({ pin_id: 1, user_id: 1, rating: 5 })
      expect(rating.valid?).to eq(true)
    end

    it 'incorrectly created - rating not fit in range ' do
      rating_not_valid = Rating.new({pin_id: 1, user_id: 1, rating: 15})
      expect(rating_not_valid.valid?).to eq(false)
    end
  end
end
