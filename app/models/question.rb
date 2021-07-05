class Question < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many :comments, dependent: :destroy
  belongs_to :category
  has_many :messages, dependent: :destroy
  accepts_nested_attributes_for :messages, allow_destroy: true

  validates :title,  length: { maximum: 35 }
  validates :category_id,  numericality: { other_than: 1, message: 'を選択してください' }

  with_options presence: true do
    validates :title
    validates :category_id
    validates :outline
  end

  def self.search(search)
    if search != ""
      Question.where('title LIKE(?)', "%#{search}%")
    else
      Question.all
    end
  end
end
