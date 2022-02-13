require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できる' do
      it "全ての項目が入力されていれば登録できる" do
        expect(@user).to be_valid
    end
  end
    context '新規登録できない' do
    it "ニックネームが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it "メールアドレスが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it "姓（全角）が空では登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it "名（全角）が空では登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it "姓（カナ）が空では登録できない" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end
    it "名（カナ）が空では登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it "birth_dateが空では登録できない" do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth date can't be blank"
    end
    it "重複したメールアドレスは登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
    end
    it "メールアドレスに@を含まない場合は登録できない" do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it "パスワードが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it "パスワードが6文字未満では登録できない" do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end
    it "英字のみのパスワードでは登録できない" do
      @user.password = 'abcdefg'
      @user.password_confirmation = 'abcdefg'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password は半角英数を両方含む必要があります"
    end
    it "数字のみのパスワードでは登録できない" do
      @user.password = '0123456789'
      @user.password_confirmation = '0123456789'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password は半角英数を両方含む必要があります"
    end
    it "全角文字を含むパスワードでは登録できない" do
      @user.password = 'あabcde123'
      @user.password_confirmation = 'あabcde123'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password は半角英数を両方含む必要があります"
    end
    it "パスワードとパスワード（確認用）が不一致だと登録できない" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it "姓（全角）に半角文字が含まれていると登録できない" do
      @user.last_name = 'hankaku'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name は全角でご入力下さい"
    end
    it "名（全角）に半角文字が含まれていると登録できない" do
      @user.first_name = 'hankaku'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name は全角でご入力下さい"
    end
    it "姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
      @user.last_name_kana = 'あ阿１1＠@'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana は全角カタカナでご入力下さい"
    end
    it "名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
      @user.last_name_kana = 'あ阿１1＠@'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana は全角カタカナでご入力下さい"
    end
   end
  end
end
