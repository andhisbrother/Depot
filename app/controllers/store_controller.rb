class StoreController < ApplicationController
  before_action :time_date

  def index
  	@products = Product.all
  	@count = increment_count
  end
end
