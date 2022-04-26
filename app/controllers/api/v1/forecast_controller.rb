# frozen_string_literal: true

module Api
  module V1
    class ForecastController < ApplicationController
      before_action :check_location

      def index
        forecast = ForecastFacade.find_forecast(@coordiantes[:lat], @coordiantes[:lng])
        render json: ForecastSerializer.weather(forecast)
      end

      private

      def check_location
        if params[:location].present?
          @coordiantes = LocationFacade.find_coords(params[:location])
        else
          render status: 404
        end
      end
    end
  end
end
