class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    def time_date
      @time = Time.now.strftime("%H:%M")
      @date = Time.now.strftime("%e %B, %Y")
    end

  private

    def current_cart
     	Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
     	cart = Cart.create
     	session[:cart_id] = cart.id
     	cart
    end

    def increment_count
        session[:counter] ||= 0
        session[:counter] += 1
        if session[:counter] > 5
          [session[:counter], "krat"].join(" ")
        end
    end    
    
end
