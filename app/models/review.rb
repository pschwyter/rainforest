class Review < ActiveRecord::Base

	belongs_to :product
	belongs_to :user

	scope :newest, -> { order(created_at: :desc) }

end
