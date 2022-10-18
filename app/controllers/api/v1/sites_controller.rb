module Api
  module V1
    class SitesController < ApplicationController
      before_action :set_site, only: [:edit, :update, :destroy]
      
      # GET /sites
      def index
        render json: Site.all, status: :ok
      end

      # POST /site
      def create
        site = Site.create(site_params)

        if site.save
          render json: site, status: :created
        else
          render json: { 
            error: site.errors
          }, status: :unprocessable_entity
        end
      end

      # PUT /sites/:id
      def update
        if @site.update(site_params)
          render json: @site, status: 200
        else
          render json: { 
            error: site.errors
          }, status: :unprocessable_entity
        end
      end

      # DELETE /sites/:id
      def destroy
        @site.destroy!

        head :no_content
      end


    private

      def site_params
        params.permit(:name, :description)
      end

      def set_site
        @site = Site.find(params[:id])
        render json: {
          error: 'not found'
        }, status: 404 if @site.nil?
      end
    end
  end
end
