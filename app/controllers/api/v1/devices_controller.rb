module Api
  module V1
    class DevicesController < ApplicationController
      before_action :set_site
      before_action :set_device, only: %i[update destroy]

      def index
        render json: @site.devices, status: :ok
      end
    
      def create
        device = @site.devices.new(device_params)

        if device.save
          render json: device, status: :created
        else
          render json: {
            error: device.errors
          }, status: :unprocessable_entity
        end
      end
    
      def update
        if @device.update(device_params)
          render json: @device, status: :ok
        else
          render json: {
            error: @device.errors
          }, status: :unprocessable_entity
        end
      end
    
      def destroy
        @device.destroy!
        
        head :no_content
      end



    private

      def set_site
        @site = Site.find_by_id(params[:site_id])
        render json: {
          error: 'not found'
        }, status: 404 if @site.nil?
      end

      def set_device
        @device = Device.find_by_id(params[:id])
        render json: {
          error: 'not found'
        }, status: 404 if @device.nil?
      end

      def device_params
        params.permit(:variant_name, :manufacturer,)
      end
      end
  end
end
