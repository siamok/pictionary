require 'rails_helper'
require 'devise'

RSpec.describe Pin, type: :request do
  before(:each) do
    @user = create(:user)
  end
  after(:each) do
    User.destroy_all
  end

  context "showing" do
    it 'lists nothing, pins are empty' do
      get pins_path
      sign_in @user
      expect(@pins.nil?).to be(true)
    end

    it 'lists pins' do
      pin = create(:pin)

      sign_in @user
      get pins_path

      expect(response.body.include?(pin.description)).to be(true)
      expect(response.body.include?("@"+@user.name)).to be(true)
      expect(response.body.include?('Rating: not rated yet')).to be(true)
    end
  end

  context "creating pins" do
    it 'tries to create new' do
      sign_in @user

      get new_pin_path

      expect(response).to render_template(:new)

      expect(response).to be_successful
      expect(@pin.nil?).to eq(true)
    end
  end

  context "Get /new" do
    it 'returns created pin' do
      get '/pins/new'
      # expect(response).to be_successful
      expect(@pin.nil?).to eq(true)
    end
  end
end
