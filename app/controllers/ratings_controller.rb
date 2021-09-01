class RatingsController < ApplicationController
  def create
    byebug
    if rated?
      update
    format.html { redirect_to @pin, notice: 'Pin was successfully updated.' }
  end

  def update

  end

private
  def pin_params
    params.require(:rating).permit(:pin_id, :user_id, :rating)
  end
end
