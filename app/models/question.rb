class Question < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many :comments
  belongs_to :category
  has_many :messages, dependent: :destroy
  accepts_nested_attributes_for :messages, allow_destroy: true

  with_options presence: true do
    validates :title
    validates :category_id
    validates :outline
    validates :content
  end
end
