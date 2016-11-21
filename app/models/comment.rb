class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tale
end
