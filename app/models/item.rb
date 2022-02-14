class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :users
  has_many :orders
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_days


  validates :title, :text, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :shipping_cost_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :shipping_days_id, numericality: { other_than: 1, message: "can't be blank" } 

end
