class Product < ActiveRecord::Base
default_scope :order => 'title'
has_many :line_items
has_many :orders, through: :line_items
before_destroy :ensure_not_referenced_by_any_line_item

	private

		def ensure_not_referenced_by_any_line_item
			if line_items.empty?
				return true
			else
				errors.add(:base, 'Existuju polozky')
				return false
			end
		end

validates :title, :description, :image_url, :presence => true
validates :price, :numericality => {:greater_than_or_equal_to => 0.01 }
validates :title, :uniqueness => true, :length => {:minimum => 10 }
validates :image_url, :format => {
	:with => %r{\.(gif|jpg|png)\z}i,
	:message => 'musi ist o adresu url pre obrazok typu GIF, JPG alebo PNG'
}

end
