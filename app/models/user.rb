class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :trips
  has_many :trip_comments
  has_many :plan_comments
  has_one_attached :image

  validates :password, 
  format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "パスワードは半角英数字のみ、半角英数字混合で設定してください" },
   if: -> { password.present? }


  with_options presence: true do
    validates :nickname
    validates :gender_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :age_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :birthday
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  end


  def self.default
    dummy_data = {
      "id": '0.5',
      "email": 'dammy@gmail.com',
      "encrypted_password": 'dummy1234',
      "nickname": 'ダミー',
      "gender_id": '2',
      "age_id": '34',
      "birthday": '1990-01-01',
      "prefecture_id": '2',
      "profile": 'こんにちは！',
      "image": '../app/assets/images/human.png'
    }
    new(dummy_data)
  end


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
  belongs_to :age
  belongs_to :prefecture

end