class BuyingRecordsController < ApplicationController

  def index
    @order_shipping = OrderShipping.new
    @item = Item.find(params[:item_id])
  end

  def new
  end

  def create
    @order_shipping = OrderShipping.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_shipping.valid?
       pay_item
       @order_shipping.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_shipping).permit(:zip_code, :shipping_region_id, :shipping_city, :shipping_street, :shipping_building, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
  Payjp.api_key = "sk_test_d056864b3feb42b0c47306c9"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
  Payjp::Charge.create(
    amount: @item.items_price,  # 商品の値段
    card: order_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
end
end
