require 'rails_helper'

RSpec.describe SellitemAddress, type: :model do
  before do
    @sellitemaddress = FactoryBot.build(:SellitemAddress)
  end
  describe "商品購入機能" do
    context '商品の購入できるとき' do
      it '必須項目があれば購入できる' do
        expect(@sellitemaddress).to be_valid
      end
      it '建物名がなくても購入できる' do
        @sellitemaddress.building = ''
        expect(@sellitemaddress).to be_valid
      end
    end
    context '商品の購入ができないとき' do  
      it '郵便番号が空では購入できない' do
        @sellitemaddress.postal_code = '' 
        @sellitemaddress.valid?
        expect(@sellitemaddress.errors.full_messages).to include("Postal codeを入力してください")
      end
      it '郵便番号はハイフンがないと購入できない' do
        @sellitemaddress.postal_code = '1234567'
        @sellitemaddress.valid?
        expect(@sellitemaddress.errors.full_messages).to include("Postal codeは不正な値です")
      end
      it '都道府県のIDが1では購入できない' do
        @sellitemaddress.region_id = 1
        @sellitemaddress.valid?
        expect(@sellitemaddress.errors.full_messages).to include("Regionは1以外の値にしてください")
      end
      it '市区町村が空では購入できない' do
        @sellitemaddress.town = ''
        @sellitemaddress.valid?
        expect(@sellitemaddress.errors.full_messages).to include("Townを入力してください")
      end
      it '番地が空では購入できない' do
        @sellitemaddress.numbering = ''
        @sellitemaddress.valid?
        expect(@sellitemaddress.errors.full_messages).to include("Numberingを入力してください")
      end
      it '電話番号が空では購入できない' do
        @sellitemaddress.telephone = ''
        @sellitemaddress.valid?
        expect(@sellitemaddress.errors.full_messages).to include("Telephoneを入力してください")
      end
      it '電話番号はハイフンありでは購入できない' do
        @sellitemaddress.telephone = '123-456-789'
        @sellitemaddress.valid?
        expect(@sellitemaddress.errors.full_messages).to include("Telephoneは不正な値です")
      end
      it '電話番号は12桁以上だと購入できない' do
        @sellitemaddress.telephone = '123456789098'
        @sellitemaddress.valid?
        expect(@sellitemaddress.errors.full_messages).to include("Telephoneは不正な値です")
      end
      it 'トークンが空では登録できないこと' do
        @sellitemaddress.token = ''
        @sellitemaddress.valid?
        expect(@sellitemaddress.errors.full_messages).to include("Tokenを入力してください")
      end
      it 'ユーザーのIDが存在しないと購入できない' do
        @sellitemaddress.user_id = ''
        @sellitemaddress.valid?
        expect(@sellitemaddress.errors.full_messages).to include("Userを入力してください")
      end
      it '商品のIDが存在しないと購入できない' do
        @sellitemaddress.item_id = ''
        @sellitemaddress.valid?
        expect(@sellitemaddress.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end  
end

