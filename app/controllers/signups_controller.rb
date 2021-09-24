class SignupsController < ApplicationController

  def create
    @signup = Signup.new(signup_params)
    if @signup.valid?
      @signup.save
      render json: @signup.activity.to_json(except: [:created_at, :updated_at]), status: :created
    else
      render json: {"errors": ["validation errors"]}, status: :unprocessable_entity
    end
  end

  private
  def signup_params
    params.permit(:camper_id, :activity_id, :time)
  end
end
