FactoryBot.define do
  factory :item do
    # association :user
    name                 {"商品名"}
    description          {"商品説明"}
    category_id          {2}
    condition_id         {2}
    shipping_cost_id     {2}
    prefecture_id        {2}
    shipping_days_id     {2}
    price                {1234}
    user_id              {FactoryBot.create(:user).id}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/IMG_0001.JPG'), filename: 'IMG_0001.JPG')
    end
  end
end
