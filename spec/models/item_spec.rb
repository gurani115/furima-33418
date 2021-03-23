require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.create(:item)
  end
  describe '商品出品' do
    context '商品の出品ができる時' do
      it '必須項目が存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品の出品ができない' do
      it 'product_nameが空では出品できない' do
        @item.product_name = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Product nameを入力してください")
      end
      it 'explanationが空では出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanationを入力してください")
      end
      it 'category_idが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Categoryを入力してください")
      end
      it 'state_idが空では出品できない' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Stateを入力してください")
      end
      it 'delivery_idが空では出品できない' do
        @item.delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliveryを入力してください")
      end
      it 'region_idが空では出品できない' do
        @item.region_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Regionを入力してください")
      end
      it 'day_idが空では出品できない' do
        @item.day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Dayを入力してください")
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceを入力してください")
      end
      it 'priceが半角数字以外では出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceは一覧にありません")
      end
    end
  end  
end
