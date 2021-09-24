class ActivitiesController < ApplicationController

  def index
    @activites = Activity.all
    render json: @activites.to_json(excpet: [:created_at, :updated_at])
  end

  def destroy
    @activity = Activity.find_by(id: params[:id])
    if @activity
      @activity.destroy
      render json: {}
    else
      render json: {"error": "Activity not found"}, status: :not_found
    end
  end
end
