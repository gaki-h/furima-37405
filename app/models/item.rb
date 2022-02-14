class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  # has_many :users
  has_many :orders
  has_one_attached :image
end
