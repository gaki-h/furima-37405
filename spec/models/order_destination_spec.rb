require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  describe '商品購入機能' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      sleep 0.1
      @order_destination = FactoryBot.build(:order_destination, user_id: @user.id, item_id: @item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_destination).to be_valid
      end
      it 'building_nameは空でも保存できる' do
        @order_destination.building_name = ''
        expect(@order_destination).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "tokenが空では保存できない" do
        @order_destination.token = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "クレジットカード情報を入力してください"
      end
      it 'post_codeが空だと保存できない' do
        @order_destination.post_code = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "郵便番号を入力してください"
      end
      it 'prefectureが空だと保存できない' do
        @order_destination.prefecture_id = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "都道府県を選択してください"
      end
      it 'municipalitiesが空だと保存できない' do
        @order_destination.municipalities = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "市区町村を入力してください"
      end
      it 'addressが空だと保存できない' do
        @order_destination.address = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "番地を入力してください"
      end
      it 'phone_numberが空だと保存できない' do
        @order_destination.phone_number = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "電話番号を入力してください"
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @order_destination.post_code = '1234567'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "郵便番号はハイフン(-)を入れて入力してください"
      end
      it 'phone_numberは数字で入力しないと保存できない' do
        @order_destination.phone_number = 'あ阿-aA'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "電話番号は数字のみで入力してください"
      end
      it 'userが紐付いていなければ登録できない' do
        @order_destination.user_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Userを入力してください"
      end
      it 'itemが紐付いていなければ登録できない' do
        @order_destination.item_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Itemを入力してください"
      end
      it 'prefecture_idが1では登録できない' do
        @order_destination.prefecture_id = 1
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "都道府県を選択してください"
      end
    end
  end
end
