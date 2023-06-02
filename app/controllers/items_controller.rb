class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  def index
    #@items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end
end

  private

def item_params
  params.require(:item).permit(:items_name, :items_description, :category_id, :condition_id, :shipping_fee_id,
                               :shipping_region_id, :shipping_time_id, :items_price, [:image]).merge(user_id: current_user.id)
end

def move_to_index
  redirect_to action: :index unless user_signed_in?
end
