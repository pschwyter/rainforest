class Review < ActiveRecord::Base

	belongs_to :product
	belongs_to :user

	validates :comment, presence: true

	scope :newest, -> { order(created_at: :desc) }

end
