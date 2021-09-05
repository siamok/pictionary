require 'rails_helper'

RSpec.describe Pin, type: :request do
  context "GET /index" do
    it 'gets a success response' do
      get pins_path
      expect(response).to be_success
      expect(@pins.nil?).to eq(true)
    end
  end

  context "Get /new" do
    it 'returns created pin' do
      get '/pins/new'
      # expect(response).to be_success
      expect(@pin.nil?).to eq(true)
    end
  end
end
