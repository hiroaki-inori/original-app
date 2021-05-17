class Like < ApplicationRecord
  belongs_to :user
  belongs_to :comment

  with_options presence: true do
    validates :comment_id
    validates :user_id
  end
end
