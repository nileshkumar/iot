module Api
  module V1
    class SitesController < ApplicationController
      before_action :set_site, only: [:edit, :update, :destroy]
      
      api :GET, "/api/v1/sites", "This end point lists sites"
      def index
        render json: Site.all, status: :ok
      end

      api :POST, "/api/v1/sites", "This end point create a site"
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

      api :PATCH, "/api/v1/sites/:id", "This end point update a site"
      api :PUT, "/api/v1/sites/:id", "This end point update a site"
      def update
        if @site.update(site_params)
          render json: @site, status: 200
        else
          render json: { 
            error: site.errors
          }, status: :unprocessable_entity
        end
      end

      api :DELETE, "/api/v1/sites/:id", "This end point deletes a site"
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
