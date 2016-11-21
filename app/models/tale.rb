class Tale < ApplicationRecord
	#Allows users to submit tales
	default_scope { order("created_at DESC") } #Sets default tale order to descending
	belongs_to :user #sets relationship with user
	has_many :category #sets relationship with category
	has_many :comments, dependent: :destroy #sets relationship with comments, and makes comments reliant on tales.
end
