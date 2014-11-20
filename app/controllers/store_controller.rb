class StoreController < ApplicationController
  before_action :time_date

  def index
  	@products = Product.all
  	@cart = current_cart
  	@count = increment_count
  end
end
