class Message < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :question
  belongs_to :who

  validates :sentence,  presence: true
end
