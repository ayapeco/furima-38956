class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname,           presence: true
  validates :email,              presence: true, uniqueness: { case_sensitive: true }
  validates :first_name,         presence: true
  validates :family_name,        presence: true
  validates :first_name_kana,    presence: true
  validates :family_name_kana,   presence: true
  validates :nickname,           presence: true
  validates :birthday,           presence: true
  validates :password,           presence: true, length: { minimum: 6 }
  has_many :items
  has_many :buying_records

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります'}
    #validates :password_confirmation, format: { with: VALID_PASSWORD_REGEX}


  with_options allow_blank: true do

    with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/ } do
      validates :first_name
      validates :family_name
    end

    with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :first_name_kana
      validates :family_name_kana
  end
end
end