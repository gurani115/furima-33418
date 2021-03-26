class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchase

  with_options presence: true do
    validates :nickname
    validates :first_name
    validates :last_name
    validates :kana_first_name
    validates :kana_last_name
    validates :birthday
    validates :last_name, format: {with: /\A[ぁ-んァ-ン一-龥々]+\z/}
    validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥々]+\z/}
    validates :kana_last_name, format: {with: /\A[ァ-ヶー－]+\z/ }
    validates :kana_first_name, format: {with: /\A[ァ-ヶー－]+\z/ }
  end 
  validates :password, length: {minimum: 6 }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
end
