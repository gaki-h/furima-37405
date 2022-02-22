require 'rails_helper'
RSpec.describe Item, type: :model do
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
        expect(@item.errors.full_messages).to include "画像を入力してください"  
      end
      it "nameが空だと出品できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名を入力してください"  
      end
      it "descriptionが空だと出品できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の説明を入力してください"  
      end
      it "category_idが空だと出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーを選択してください"  
      end
      it "condition_idが空だと出品できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態を選択してください"  
      end
      it "shipping_cost_idが空だと出品できない" do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料のご負担を選択してください"  
      end
      it "prefecture_idが空だと出品できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "発送元の都道府県を選択してください"  
      end
      it "shipping_days_idが空だと出品できない" do
        @item.shipping_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "発送にかかる日数を選択してください"  
      end
      it "priceが空だと出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "価格を入力してください"  
      end
      it "priceが¥300以下だと出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "価格は一覧にありません"  
      end
      it "priceが¥9,999,999以上だと出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "価格は一覧にありません"  
      end
      it "priceが半角数値でないと出品できない" do
        @item.price = '１２３４５'
        @item.valid?
        expect(@item.errors.full_messages).to include "価格は一覧にありません"  
      end
      it "priceが半角英語だと出品できない" do
        @item.price = 'abcdf'
        @item.valid?
        expect(@item.errors.full_messages).to include "価格は一覧にありません"  
      end
      it "userが紐付いていないと出品できない" do
        @item.user_id = ''
        @item.valid?
        expect(@item.errors.full_messages) 
      end
    end
  end
end
