class LeasesController < ApplicationController

    def index
        render json: Lease.all
    end

    def show
        lease = Lease.find_by(id: params[:id])
        if lease
            render json: lease
        else
            render json: {error: "Lease not found"}, status: :not_found
        end
    end
    
    def create
        lease = Lease.create(lease_params)
        render json: lease, status: :created
    end

    def destroy
        lease = Lease.find_by(id: params[:id])
        if lease
            lease.destroy
            head :no_content
        else
            render json: {error: "Lease not found"}, status: :not_found
        end
    end

    private
    def lease_params
        params.permit(:rent, :apartment_id, :tenant_id)
    end

end
