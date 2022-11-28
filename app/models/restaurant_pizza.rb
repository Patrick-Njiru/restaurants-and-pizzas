class RestaurantPizza < ApplicationRecord
    belongs_to :pizza
    belongs_to :restaurant
    validates :price, comparison: { greater_than: 1, less_than: 30}
end
