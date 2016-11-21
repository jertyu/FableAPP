class Tale < ApplicationRecord
	default_scope { order("created_at DESC") }
	belongs_to :user
	has_many :category
	has_many :comments, dependent: :destroy
end
