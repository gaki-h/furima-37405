class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    # VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    # validates :password, format: { with: VALID_PASSWORD_REGEX, message: "は半角英数を両方含む必要があります"}
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります' 
    
    validates :nickname, presence: true
    validates :last_name, presence: true, length: { maximum: 10 },format: {with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角でご入力下さい"}
    validates :first_name, presence: true, length: { maximum: 10 },format: {with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角でご入力下さい"}
    validates :last_name_kana, presence: true, length: { maximum: 10 },format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: "は全角カタカナでご入力下さい"}
    validates :first_name_kana, presence: true, length: { maximum: 10 },format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: "は全角カタカナでご入力下さい"}
    validates :birth_date, presence: true
    
    # include ActiveHash::Associations
    has_many :items
    # has_many :orders
     
end
