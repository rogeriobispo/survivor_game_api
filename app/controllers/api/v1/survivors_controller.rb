module Api
  module V1
    class SurvivorsController < Api::V1::ApiController
      before_action :set_survivor, only: [:update, :infected]
      # /api/v1/survivors/1
      def update
        if @survivor.update(survivor_update_params) && not_empty_param
          render json: @survivor
        else
          render json: @survivor.errors, status: :unprocessable_entity
        end
      end

      # /api/v1/survivors
      def create
        @survivor = Survivor.new(survivor_params)
        if @survivor.save
          render json: @survivor, status: :created
        else
          render json: @survivor.errors, status: :unprocessable_entity
        end
      end

      # /api/v1/survivors/1/infected
      def infected
        @survivor.add_contaminated_point
        render json: @survivor if @survivor.save
      end

      private

      def set_survivor
        @survivor = Survivor.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { not_found: 'Survivor not found' }, status: :unprocessable_entity
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
