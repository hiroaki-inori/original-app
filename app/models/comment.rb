class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :comment_likes, dependent: :destroy

  validates :text, presence:true
end
