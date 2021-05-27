class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  validates :password,  format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :nickname,  length: { maximum: 10 }
       
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
  has_many :sns_credentials

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みであるか判断
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end

  def liked_by?(comment_id)
    comment_likes.where(comment_id: comment_id).exists?
  end
end
