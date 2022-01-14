class ApartmentsController < ApplicationController

    def index
        render json: Apartment.all
    end

    def show
        apt = find_apt
        if apt
            render json: apt
        else
            render json: {error: "Apartment not found"}, status: :not_found
        end
    end

    def create
        apt = Apartment.create(apt_params)
        render json: apt, status: :created
    end

    def update
        apt = find_apt
        if apt
            apt.update(apt_params)
            render json: apt, status: :accepted
        else
            render json: {error: "Apartment not found"}, status: :not_found
        end
    end

    def destroy
        apt = find_apt
        if apt
            apt.destroy
            head :no_content
        else
            render json: {error: "Apartment not found"}, status: :not_found
        end
    end

    private

    def find_apt
        Apartment.find_by(id: params[:id])
    end

    def apt_params
        params.permit(:number)
    end

end
