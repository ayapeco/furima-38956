class BuyingRecordsController < ApplicationController
before_action :authenticate_user!, only: [:index, :create]
before_action :set_item, only: [:index, :create]
before_action :prevent_url, only: [:index, :create]

  def index
    @order_shipping = OrderShipping.new
    @item = Item.find(params[:item_id])
  if current_user == @item.user
    redirect_to root_path
    end
  end

  def new
  end

  def create
    @order_shipping = OrderShipping.new(order_params)
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
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
  Payjp::Charge.create(
    amount: @item.items_price,  # 商品の値段
    card: order_params[:token], # カードトークン
    currency: 'jpy'             # 通貨の種類（日本円）
  )
end
def set_item
  @item = Item.find(params[:item_id])
end
def prevent_url
  @item = Item.find(params[:item_id])
  if @item.buying_record
    redirect_to root_path
  end
  
 end
end
