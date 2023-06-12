class BuyingRecordsController < ApplicationController

  def index
    @order_shipping = OrderShipping.new
    @item = Item.find(params[:item_id])
  end

  def new
  end

  def create
    #binding.pry
    @order_shipping = OrderShipping.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_shipping.valid?
       @order_shipping.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_shipping).permit(:zip_code, :shipping_region_id, :shipping_city, :shipping_street, :shipping_building, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  end
