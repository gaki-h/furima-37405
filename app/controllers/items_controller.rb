class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @item = Item.all
    # @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :condition_id, :shipping_cost_id, :prefecture_id, :image, :name, :description, :shipping_days_id, :price).merge(user_id: current_user.id)
  end
end
