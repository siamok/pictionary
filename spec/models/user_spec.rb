require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should have many pins' do
    res = User.reflect_on_association(:pins)
    expect(res.macro).to eq(:has_many)
  end
end
