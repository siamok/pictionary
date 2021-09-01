require 'rails_helper'

RSpec.describe Pin, type: :request do
  context "GET /index" do
    it 'gets a success response' do
      get pins_path
      expect(response).to be_success
      expect(@pins).to be_success
    end
  end
end
