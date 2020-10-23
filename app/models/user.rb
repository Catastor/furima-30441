class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :comments
  has_many :buyers

  validates :nickname, presence: true, length: {maximum: 40}
  validates :birthday, presence: true
  validates :password, format: { with: /\A[a-zA-Z\d]+\z/, message:"include both letters and numbers" }, length: {minimum: 5}
  validates :birthday, presence: true
  with_options presence: true, format: { with: /\A[一-龥]+\z/ } do
    validates :last_name, format: { message: "Full-Width characters" }
    validates :first_name, format: { message: "Full-Width characters" }
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :last_furigana, format: { message: "Full-width katakana charaters" }
    validates :first_furigana, format: { message: "Full-width katakana charaters" }
  end
end
