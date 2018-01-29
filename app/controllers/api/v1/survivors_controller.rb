module Api
  module V1
    class SurvivorsController < Api::V1::ApiController
      def create
        @survivor = Survivor.new(survivor_params)
        if @survivor.save
          render json: @survivor, status: :created
        else
          render json: @survivor.errors, status: :unprocessable_entity
        end
      end

      private

      def survivor_params
        params.require(:survivor).permit(:name,
                                         :age,
                                         :gender,
                                         :last_latitude,
                                         :last_longitude)
      end
    end
  end
end
