class ClientsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

    def index
        clients = Client.all
        render json: clients, status: 200
    end

    def update
        client_id = params[:id]
        client = Client.find client_id
        client.update! client_params
        render json: client, status: 200
    end

    def show
        client_id = params[:id]
        client = Client.find client_id
        render json: client, status: 200, serializer: ClientShowSerializer
    end

    private

    def client_params
        params.permit :name, :age
    end

    def record_not_found
        render json: { error: "Client not found" }, status: 404
    end

    def invalid_record invalid
        render json: {errors: invalid.record.errors.to_a}, status: 422
    end
end
