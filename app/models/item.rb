class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :users
  # has_many :orders
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_days

with_options presence: true do
  validates :image
  validates :name
  validates :description
  validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
end

with_options numericality: { other_than: 1, message: "can't be blank" } do
  validates :category_id
  validates :condition_id
  validates :shipping_cost_id
  validates :prefecture_id
  validates :shipping_days_id
  end
end
