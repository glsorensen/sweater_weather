# frozen_string_literal: true

module Api
  module V1
    class RoadTripController < ApplicationController
      def create
        if params[:origin] && params[:destination] && params[:api_key]
          trip_info = DurationFacade.duration(params[:origin], params[:destination])
          if trip_info.nil?
            render json: { error: 'no route available' }
          else
            render json: RoadtripSerializer.new(trip_info)
          end
        else
          render json: { status: :unauthorized }
        end
      end
    end
  end
end
