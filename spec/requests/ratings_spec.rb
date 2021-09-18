require 'rails_helper'

RSpec.describe Rating, type: :request do
  describe 'request to add a rating' do
    before (:each) do
      @pin = build(:pin)
      @pin.save
    end
    it 'validates index request' do
      
      # post pin_ratings_path pin_id: 1, id: 1, user_id: 1, rating: 1
      # expect(response).to be_successful
    end
  end
end
# pin_ratings POST   /pins/:pin_id/ratings(.:format)          ratings#create
# edit_pin_rating GET    /pins/:pin_id/ratings/:id/edit(.:format) ratings#edit
#      pin_rating PATCH  /pins/:pin_id/ratings/:id(.:format)      ratings#update
#                 PUT    /pins/:pin_id/ratings/:id(.:format)      ratings#update
#                 DELETE /pins/:pin_id/ratings/:id(.:format)      ratings#destroy