class MembershipsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

    def create
        membership = Membership.create! membership_params
        render json: membership, status: 201
    end

    private

    def membership_params
        params.permit :gym_id, :client_id, :charge
    end

    def invalid_record invalid
        render json: { errors: invalid.record.errors.to_a }, status: 422
    end
end
