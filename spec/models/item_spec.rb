require 'rails_helper'

RSpec.describe Item, type: :model do
    before do
      @item = FactoryBot.build(:item)
    end

context '商品出品ができる時' do
  it 'image,items_name,items_description,category,condition,shipping_fee,shipping_region,shipping_time,items_priceが存在すれば登録できる' do
     expect(@item).to be_valid
   end

   it 'items_priceが300円なら出品できる' do
    @item.items_price = 300
    expect(@item).to be_valid
  end
  it 'items_priceが9,999,999円なら出品できる' do
    @item.items_price = 9_999_999
    expect(@item).to be_valid
  end
  it 'items_priceが半角なら出品できる' do
    @item.items_price = 300
    expect(@item).to be_valid
  end
      
context '商品出品ができない時' do
  it 'imageが空だと出品できない' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end
  it "items_nameがない場合は登録できない" do
    @item.items_name = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Items name can't be blank")
end
  it "items_descriptionがない場合は登録できない" do
    @item.items_description = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Items description can't be blank")
end
  it "categoryがない場合は登録できない" do
  @item.category = nil
  @item.valid?
  expect(@item.errors.full_messages).to include("Category can't be blank")
end
it "conditionがない場合は登録できない" do
  @item.condition = nil
  @item.valid?
  expect(@item.errors.full_messages).to include("Condition can't be blank")
end
it "shipping_feeがない場合は登録できない" do
  @item.shipping_fee = nil
  @item.valid?
  expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
end
it "shipping_regionがない場合は登録できない" do
  @item.shipping_region = nil
  @item.valid?
  expect(@item.errors.full_messages).to include("Shipping region can't be blank")
end
it "Shipping_timeがない場合は登録できない" do
  @item.shipping_time = nil
  @item.valid?
  expect(@item.errors.full_messages).to include("Shipping time can't be blank")
end
it "Shipping_timeがない場合は登録できない" do
  @item.items_price = nil
  @item.valid?
  expect(@item.errors.full_messages).to include("Items price can't be blank")
end
it 'items_priceが全角では登録できない' do
  @item.items_price = "０００"
  @item.valid?
  expect(@item.errors.full_messages).to include("Items price is not included in the list")
end
it "items_priceが300円以下だと登録できない" do
  @item.items_price = 299
  @item.valid?
  expect(@item.errors.full_messages).to include('Items price is not included in the list')
end
it "items_priceが9,999,999円以上だと登録できない" do
  @item.items_price = 10_000_000
  @item.valid?
  expect(@item.errors.full_messages).to include('Items price is not included in the list')
end
it "priceが半角英数混合では登録できない" do
  @item.items_price = "300dollars"
  @item.valid?
  expect(@item.errors.full_messages).to include("Items price is not a number")
end
it "priceが半角英語だけでは登録できないこと" do
  @item.items_price = "threemillion"
  @item.valid?
  expect(@item.errors.full_messages).to include("Items price is not included in the list")
end
end
end
end