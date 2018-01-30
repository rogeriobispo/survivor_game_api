module Api
  module V1
    class SurvivorsController < Api::V1::ApiController
      before_action :set_survivor, only: [:update]
      def update
        if @survivor.update(survivor_update_params) && not_empty_param
          render json: @survivor
        else
          render json: @survivor.errors, status: :unprocessable_entity
        end
      end

      def create
        @survivor = Survivor.new(survivor_params)
        if @survivor.save
          render json: @survivor, status: :created
        else
          render json: @survivor.errors, status: :unprocessable_entity
        end
      end

      private

      def set_survivor
        @survivor = Survivor.find(params[:id])
      end

      def survivor_params
        params.require(:survivor).permit(:name,
                                         :age,
                                         :gender,
                                         :last_latitude,
                                         :last_longitude)
      end

      def survivor_update_params
        params.require(:survivor).permit(:last_longitude, :last_latitude)
      end

      def not_empty_param
        !survivor_update_params.empty?
      end
    end
  end
end
