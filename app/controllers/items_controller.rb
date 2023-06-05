class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
    unless @item.user_id == current_user.id
      redirect_to action: :index
  end
 end

  def update
    @item.update(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path(@item)
    else
      render :edit
    end
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

  def destroy
    if current_user.id == @item.user_id
      redirect_to root_path if @item.destroy
    else
      render :show
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

def set_item
  @item = Item.find(params[:id])
end
end