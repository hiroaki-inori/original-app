class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :password,  format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
       
  with_options presence: true do
    validates :nickname
    validates :age_id
    validates :gender_id
    validates :occupation_id
    validates :gender_id
    validates :prof_image
    validates :pr
  end

  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :age_id
    validates :gender_id
    validates :occupation_id
  end

  has_one_attached :prof_image
  has_many :questions
  belongs_to :age
  belongs_to :gender
  belongs_to :occupation
end
