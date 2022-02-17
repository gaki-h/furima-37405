class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    if user_signed_in?
    @item = Item.new
  else
    redirect_to user_session_path(@item.id)
  end
end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :condition_id, :shipping_cost_id, :prefecture_id, :image, :name, :description, :shipping_days_id, :price).merge(user_id: current_user.id)
  end
end
