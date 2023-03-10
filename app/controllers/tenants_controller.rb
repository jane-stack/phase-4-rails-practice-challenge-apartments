class TenantsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response


    def index
        render json: Tenant.all
    end

    def update
        tenant = tenant_find
        render json: tenant.update(tenant_params)
    end

    def create
        tenant = Tenant.create(tenant_params)
        render json: tenant, status: :created
    end

    def destroy
        tenant = tenant_find
        tenant.destroy
    end

    private

    def render_not_found_response
        render json: { error: "Tenant not found" }, status: :not_found
    end

    def tenant_find
        Tenant.find(params[:id])
    end

    def tenant_params
        params.permit(:name, :age)
    end

end
