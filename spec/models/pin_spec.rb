require 'rails_helper'

RSpec.describe Pin, type: :model do
  # let(:description) { "test description" }
  # let(:user_id) { 1 }
  # let(:pin) { Pin.new ({description: :description, user_id: :user_id}) }
  
  it 'should belong to user' do
    res = Pin.reflect_on_association(:user)
    expect(res.macro).to eq(:belongs_to)
  end

  it 'should have many ratings' do
    res = Pin.reflect_on_association(:ratings)
    expect(res.macro).to eq(:has_many)
  end
  
end
