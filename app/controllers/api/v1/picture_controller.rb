# frozen_string_literal: true

module Api
  module V1
    class PictureController < ApplicationController
      before_action :check_location

      def index
        background = PictureFacade.find_forecast(@location)
        render json: PictureSerializer.image(background, @location)
      end

      private

      def check_location
        if params[:location].present?
          @location = params[:location]
        else
          render status: 404
        end
      end
    end
  end
end
