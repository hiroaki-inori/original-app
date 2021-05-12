class Question < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category

  with_options presence: true do
    validates :title
    validates :category_id
    validates :outline
    validates :content
  end
end
