class PinsController < ApplicationController
  helper_method :rated?, :avg_rating_for_pin, :user_rating, :get_user_rating_by_pin_id, :avg_rating

  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /pins
  # GET /pins.json
  def index
    @pins = Pin.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 25)
  end

  # GET /pins/1
  # GET /pins/1.json
  def show
  end

  # GET /pins/new
  def new
    @pin = current_user.pins.new
  end

  # GET /pins/1/edit
  def edit
  end

  # POST /pins
  # POST /pins.json
  def create
    @pin = current_user.pins.build(pin_params)

    respond_to do |format|
      if @pin.save
        format.html { redirect_to @pin, notice: 'Pin was successfully created.' }
        format.json { render :show, status: :created, location: @pin }
      else
        format.html { render :new }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pins/1
  # PATCH/PUT /pins/1.json
  def update
    respond_to do |format|
      if @pin.update(pin_params)
        format.html { redirect_to @pin, notice: 'Pin was successfully updated.' }
        format.json { render :show, status: :ok, location: @pin }
      else
        format.html { render :edit }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pins/1
  # DELETE /pins/1.json
  def destroy
    @pin.destroy
    respond_to do |format|
      format.html { redirect_to pins_url, notice: 'Pin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_pin
    @pin = Pin.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def pin_params
    params.require(:pin).permit(:description, :image, :name)
  end

  def correct_user
    @pin = current_user.pins.find_by(id: params[:id])
    redirect_to pins_path, notice: "You are not authorized to edit this pin" if @pin.nil?
  end

  def rated?
    return false if !user_signed_in?

    !(Rating.where(user_id: current_user.id, pin_id: @pin.id).empty?)
  end

  def avg_rating_for_pin pin_id
    ratings = Rating.where(pin_id: pin_id)
    return 'not rated yet' if ratings.empty?

    ratings.inject(0) { |sum, r| sum + r.rating} / ratings.size
  end

  def avg_rating
    ratings = Rating.where(pin_id: @pin.id)
    return 'not rated yet' if ratings.empty?

    ratings.inject(0) { |sum, r| sum + r.rating} / ratings.size
  end

  def user_rating
    get_user_rating_by_pin_id @pin.id
  end

  def get_user_rating_by_pin_id pin_id
    return nil if !user_signed_in?
    rating = Rating.find_by(pin_id: pin_id, user_id: current_user.id)
    if rating.nil?
      'not rated yet'
    else
      rating.rating
    end
  end
end
