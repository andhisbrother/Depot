class Product < ActiveRecord::Base

validates :title, :description, :image_url, :presence => true
validates :price, :numericality => {:greater_than_or_equal_to => 0.01 }
validates :title, :uniqueness => true
validates :image_url, :format => {
	:with => %r{\.(gif|jpg|png)\z}i,
	:message => 'musi ist o adresu url pre obrazok typu GIF, JPG alebo PNG'
}

end
