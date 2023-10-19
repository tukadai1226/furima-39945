class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :family_name, presence: true 
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  VALID_NAME_KANA_REGEX =/\A[ァ-ヶー－]+\z/
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :family_name, format: { with: VALID_NAME_REGEX }
  validates :first_name, format: { with: VALID_NAME_REGEX }
  validates :family_name_kana, format: { with: VALID_NAME_KANA_REGEX }
  validates :first_name_kana, format: { with: VALID_NAME_KANA_REGEX }

end
