class RestaurantsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    wrap_parameters format: []

    # GET /restaurants
    def index
        render json: Restaurant.all
    end

    # GET /restaurants/:id
    def show
        restaurant = find_restaurant
        render json: restaurant, serializer: EachRestaurantPizzasSerializer
    end

    # DELETE /restaurants/:id
    def destroy
        restaurant = find_restaurant
        restaurant.destroy
        head :no_content
    end

    private

    def restaurant_params
        params.permit(:id, :name, :address)
    end

    def find_restaurant
        Restaurant.find(params[:id])
    end

    def render_not_found_response
        render json: {error: "Restaurant not found"}, status: :not_found
    end
end

