class ItemsController < ApplicationController
  def index

  endprivate

  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end
