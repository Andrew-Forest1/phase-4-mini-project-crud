class SpicesController < ApplicationController
    before_action :find_spice, only: [:update, :destroy, :show] 

    def index 
        spices = Spice.all
        render json: spices, status: 200
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: 201
    end

    def update
        @spice.update(spice_params)
        render json: @spice, status: :accepted
    end

    def destroy
        @spice.destroy
        head :no_content
    end

    private 

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def find_spice
        @spice = Spice.find(params[:id])
    end
end