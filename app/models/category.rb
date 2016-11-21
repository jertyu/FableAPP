class Category < ApplicationRecord
	#Will allow users to set a category for their tales
	belongs_to :tale #sets relationship with tale
end
