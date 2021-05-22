class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :comment_likes

  validates :text, presence:true
end
