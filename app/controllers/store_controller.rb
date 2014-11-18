class StoreController < ApplicationController
  def index
  	@products = Product.all
  	@count = increment_count
  	time_date
  end
end
