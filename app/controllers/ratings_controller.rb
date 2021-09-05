class RatingsController < ApplicationController
  before_action :set_rating, :set_pin

  def create
    @rating = @pin.ratings.create(rating_params)

    redirect_to pin_path(@pin)
  end

  def edit
    @rating.update(rating_params)
  end

  def update
    @rating.update(rating_params)

    redirect_to @pin
  end

  def destroy
    @rating.destroy
    redirect_to pins_path
  end

private
  def set_rating
    @rating = Rating.find_by(params[:id])
  end

  def set_pin
    @pin = Pin.find_by(id: params[:pin_id])
  end

  def rating_params
    params.require(:rating).permit(:pin_id, :rating, :user_id)
  end
end
