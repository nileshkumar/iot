module Api
  module V1
    class SitesController < ApplicationController
      before_action :set_site, only: [:edit, :update, :destroy]
      
      # GET /sites
      def index
        render json: Site.all
      end

      # POST /site
      def create
        site = Site.create(site_params)

        if site.save
          render json: site, status: :created
        else
          render json: site.errors, status: :unprocessable_entity
        end
      end

      # PUT /sites/:id
      def update
        if @site.update(site_params)
          render json: @site, status: 200
        else
          render json: site.errors, status: :unprocessable_entity
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
      end
    end
  end
end
