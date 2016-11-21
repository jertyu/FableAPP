class Comment < ApplicationRecord
  #will allow users to comment on tales
  belongs_to :user #sets relationship with user
  belongs_to :tale #sets relationship with tale
end
