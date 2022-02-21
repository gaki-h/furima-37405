class OrderDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "はハイフン(-)を入れて入力してください"}
    validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :municipalities
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/, message: 'は数字のみで入力してください' }
    validates :token
  end

   def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Destination.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number, order: order)
  end
end