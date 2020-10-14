module Api
  module V1
    class HydroponicsDataController < ApplicationController
      skip_before_action :verify_authenticity_token, :only => [:create]

      def index
        hydroponic_data = HydroponicData.where(hydroponic_id: set_hydroponic)
        render json: hydroponic_data
      end

      def create
        @hydroponic_data = HydroponicData.new(hydroponic_data_params)
        @hydroponic_data.hydroponic_id = set_hydroponic.id

        if @hydroponic_data.save
          render json: @hydroponic_data, status: :created, location: @hydroponic_data
        else
          render json: @hydroponic_data.errors, status: :unprocessable_entity
        end
      end

      def last_data
        @hydroponic_data = HydroponicData.where(hydroponic_id: params[:hydroponic_id]).sort({ _id: -1 }).limit(1)
        render json: @hydroponic_data
      end

      private

      def set_hydroponic
        Hydroponic.find_by_token(params[:token])
      end

      def hydroponic_data_params
        params.permit(:hydroponic_id, :temperature, :humidity, :c, :ce, :waterflow)
      end
    end
  end
end
