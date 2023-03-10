class ApartmentsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        render json: Apartment.all
    end

    def update
        apartment = apartment_find
        render json: apartment.update(apartment_params)
    end

    def create
        apartment = Apartment.create(apartment_params)
        render json: apartment, status: :created
    end

    def destroy
        apartment = apartment_find
        apartment.destroy
    end

    private

    def apartment_find
        Apartment.find(params[:id])
    end

    def render_not_found_response
        render json: { error: "Apartment not found" }, status: :not_found
    end
    
    def apartment_params
        params.permit(:number)
    end

end
