module Api
  module V1
    class HydroponicsController < ApplicationController
      def index
        render json: set_hydroponic
      end

      private

      def set_hydroponic
        Hydroponic.find_by_token(params[:token])
      end
    end
  end
end
