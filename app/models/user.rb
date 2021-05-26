class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :password,  format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :nickname,  length: { minimum: 1, maximum: 10 }
       
  with_options presence: true do
    validates :nickname
    validates :age_id
    validates :gender_id
    validates :occupation_id
    validates :gender_id
    validates :pr
  end

  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :age_id
    validates :gender_id
    validates :occupation_id
  end

  has_one_attached :prof_image, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :comment_likes, dependent: :destroy
  belongs_to :age
  belongs_to :gender
  belongs_to :occupation

  def liked_by?(comment_id)
    comment_likes.where(comment_id: comment_id).exists?
  end
end
