class LeasesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    def create
        lease = Lease.create(lease_params)
        render json: lease, status: :created
    end

    def destroy
        lease = lease_find
        lease.destroy
    end

    private

    def render_not_found_response
        render json: { error: "Lease not found" }, status: :not_found
    end

    def lease_find
        Lease.find(params[:id])
    end

    def lease_params
        params.permit(:rent, :apartment_id, :tenant_id)
    end

end
