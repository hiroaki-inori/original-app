class Question < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many :comments, dependent: :destroy
  belongs_to :category
  has_many :messages, dependent: :destroy
  accepts_nested_attributes_for :messages, allow_destroy: true

  validates :title,  length: { minimum: 1, maximum: 35 }

  with_options presence: true do
    validates :title
    validates :category_id
    validates :outline
  end
end
