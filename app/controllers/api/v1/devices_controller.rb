module Api
  module V1
    class DevicesController < ApplicationController
      before_action :set_site
      before_action :set_device, only: %i[update destroy]
      
      api :GET, "/api/v1/sites/:site_id/devices", "This shows device list for a site"
      def index
        render json: @site.devices, status: :ok
      end
    
      api :POST, "/api/v1/sites/:site_id/devices", "This end-point for creating device for a site"
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

      api :PATCH, "/api/v1/sites/:site_id/devices/:id", "This end-point for updating device for a site"
      api :PUT, "/api/v1/sites/:site_id/devices/:id", "This end-point for updating device for a site"
      def update
        if @device.update(device_params)
          render json: @device, status: :ok
        else
          render json: {
            error: @device.errors
          }, status: :unprocessable_entity
        end
      end

      api :DELETE, "/api/v1/sites/:site_id/devices/:id", "This end ppoint for deleting device for a site"
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
