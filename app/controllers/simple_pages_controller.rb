class SimplePagesController < ApplicationController
  def other
  end
end


landing_page
class SimplePagesController < ApplicationController
  def landing_page
    @featured_product = Product.first
  end
end
