require 'rails_helper'
RSpec.describe Item, type: :model do
  # describe '#create' do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できる' do
      it "全ての項目が入力されていれば出品できる" do
        expect(@item).to be_valid
      end
    end

    context '商品出品できない' do
      it "imageが空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"  
      end
      it "nameが空だと出品できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"  
      end
      it "descriptionが空だと出品できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"  
      end
      it "category_idが空だと出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"  
      end
      it "condition_idが空だと出品できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"  
      end
      it "shipping_cost_idが空だと出品できない" do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping cost can't be blank"  
      end
      it "prefecture_idが空だと出品できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"  
      end
      it "shipping_days_idが空だと出品できない" do
        @item.shipping_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping days can't be blank"  
      end
      it "priceが空だと出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"  
      end
      it "priceが¥300以下だと出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"  
      end
      it "priceが¥9,999,999以上だと出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"  
      end
      it "priceが半角数値でないと出品できない" do
        @item.price = '１２３４５'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"  
      end
      it "priceが半角英語だと出品できない" do
        @item.price = 'abcdf'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"  
      end
    end
  end
end
