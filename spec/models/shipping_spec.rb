require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  describe '配送情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:product)
      @shipping = FactoryBot.build(:order_shipping,user_id: @user.id, item_id: @item.id)
     end
    context '内容に問題ない場合'
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shipping).to be_valid
      end
      it '建物名は空でも保存できること' do
        @order_shipping.shipping_building = ''
        expect(@order_shipping).to be_valid
      end
    end
  end

    context '内容に問題がある場合'
      it '郵便番号が必須であること' do
        @order_shipping.zip_code = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Zip_code can't be blank")
      end
      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_shipping.zip_code = '1234567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Zip code can't be blank")
      end
      it '都道府県が必須であること' do
        @order_shipping.shipping_region_id = 1
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Shipping_region can't be blank")
      end
      it '市区町村が必須であること' do
        @order_shipping.shipping_city = ""
        @order_shipping.valid?
        expect(@donation_address.errors.full_messages).to include("Shipping_region can't be blank")
      end
      it '番地が必須であること' do
        @order_shipping.shipping_street = ""
        @order_shipping.valid?
        expect(@donation_address.errors.full_messages).to include("Shipping_region can't be blank")
      end
      
      it '電話番号が必須であること' do
        @order_shipping.phone = ''
        expect(@donation_address).to be_valid
      end
      it '電話番号は10桁以上11桁以内の半角数値のみ保存可能なこと' do
        @order_shipping.phone = '123456abcあ'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("phone_number code can't be blank")
      end