class Api::V1::RentController < Api::V1::ApiController

    def index
        @rents = Rent.all

        render json: @rents
    end

    def create

        @rents = Rent.new(params.require(:rent).permit(:user_id, :book_id))
        if @rents.save
            render json: @rents, include: :user, status: :created
        else
            render json: @rents.errors, status: :unprocessable_entity
        end
    end
end
