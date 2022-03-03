class GymsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
    
    def index
        gyms = Gym.all
        render json: gyms, status: 200
    end

    def update
        gym_id = params[:id]
        gym = Gym.find gym_id
        gym.update! gym_params
        render json: gym, status: 200
    end

    def show
        gym_id = params[:id]
        gym = Gym.find gym_id
        render json: gym, status: 200
    end

    def destroy
        gym_id = params[:id]
        gym = Gym.find gym_id
        gym.destroy
        render json: {}, status: 204
    end

    private

    def gym_params
        params.permit :name, :address
    end

    def record_not_found
        render json: { error: "Gym not found" }, status: 404
    end

    def invalid_record invalid
        render json: { errors: invalid.record.errors.to_a }, status: 422
    end
end
