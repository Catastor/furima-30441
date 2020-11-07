class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :comments
  has_many :buyers
  has_many :orders

  validates :nickname, presence: true, length: { maximum: 40 }
  validates :birthday, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'include both letters and numbers' }, length: { minimum: 5 }
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
    validates :last_name, format: { message: 'Full-Width characters' }
    validates :first_name, format: { message: 'Full-Width characters' }
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :last_furigana, format: { message: 'Full-width katakana characters' }
    validates :first_furigana, format: { message: 'Full-width katakana characters' }
  end
end
