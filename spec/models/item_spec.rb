require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload("/20210327-085606.png")
    end

    context '商品出品ができる時' do

　   it 'imageが空では登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "nameがない場合は登録できないこと" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end
 
    #2
    it "explainがない場合は登録できないこと" do
      item = build(:item, explain: nil)
      item.valid?
      expect(item.errors[:explain]).to include("を入力してください")
    end
 
    #3
    it "category_idがない場合は登録できないこと" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end
 
    #4
    it "shipping_burden_idがない場合は登録できないこと" do
      item = build(:item, shipping_burden_id: nil)
      item.valid?
      expect(item.errors[:shipping_burden_id]).to include("を入力してください")
    end
 
    #5
    it "prefecture_idがない場合は登録できないこと" do
      item = build(:item, prefecture_id: nil)
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end
 
    #6
    it "shipping_day_idがない場合は登録できないこと" do
      item = build(:item, shipping_day_id: nil)
      item.valid?
      expect(item.errors[:shipping_day_id]).to include("を入力してください")
    end
 
    #7
    it "priceがない場合は登録できないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end
 
    #8
    it "nameが40文字でも登録できること" do
      user = create(:user)
      category = create(:category)
      item = build(:item, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",seller_id: user[:id],seller_id: user[:id], category_id: category[:id])
      expect(item).to be_valid
    end
 
    #9
    it "nameが41文字だと登録できないこと" do
      user = create(:user)
      category = create(:category)
 
      item = build(:item, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",seller_id: user[:id],seller_id: user[:id], category_id: category[:id])
 
      expect(item.errors[:name]).to include("文字数が多すぎます")
    end
 
    #10
    it "explainが1000文字でも登録できること" do
      user = create(:user)
      category = create(:category)
 
      item = build(:item, explain: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",seller_id: user[:id],seller_id: user[:id], category_id: category[:id])
 
      expect(item).to be_valid
    end
 
    #11
    it "explainが1001文字だと登録できないこと" do
      user = create(:user)
      category = create(:category)
      item = build(:item, explain: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",seller_id: user[:id],seller_id: user[:id], category_id: category[:id])
      expect(item.errors[:explain]).to include("文字数が多すぎます")
    end
 
 
    #12
    it "priceが299以下だと登録できないこと" do
      user = create(:user)
      category = create(:category)
      item = build(:item, price: "299",seller_id: user[:id],seller_id: user[:id], category_id: category[:id])
      expect(item.errors[:price]).to include("値段は300円以上10000000円未満を設定してください")
    end
 
    #13
    it "priceが300ちょうどだと登録できる" do
      user = create(:user)
      category = create(:category)
      item = build(:item, price: "300",seller_id: user[:id],seller_id: user[:id], category_id: category[:id])
      expect(item).to be_valid
    end
 
    #14
    it "priceが9999999だと登録できる" do
      user = create(:user)
      category = create(:category)
 
      item = build(:item, price: "9999999",seller_id: user[:id],seller_id: user[:id], category_id: category[:id])
 
      expect(item).to be_valid
    end
 
    #15
    it "priceが10000000だと登録できないこと" do
      user = create(:user)
      category = create(:category)
 
      item = build(:item, price: "10000000",seller_id: user[:id],seller_id: user[:id], category_id: category[:id])
 
      expect(item.errors[:price]).to include("値段は300円以上10000000円未満を設定してください")
    end
  end
 