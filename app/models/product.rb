class Product < ActiveRecord::Base
	validates :description, :name, presence: true
	validates :price_in_cents, numericality: {only_integer: true}


	# scope :by_category, -> (name) { joins(:categories).where(["categories.name = ? and categories.id = product.category_id", name]) }

	has_many :reviews
	has_many :users, through: :reviews
	belongs_to :category
	belongs_to :user

	def formatted_price
		price_in_dollars = price_in_cents.to_f / 100
		sprintf("%.2f", price_in_dollars)
	end

	private
	
end
