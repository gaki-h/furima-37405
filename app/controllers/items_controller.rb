class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :move_to_index, only: [:edit, :update]

  def index
    @items = Item.all.order("created_at DESC")
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
    redirect_to item_path
    else
    render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end


  private

  def item_params
    params.require(:item).permit(:category_id, :condition_id, :shipping_cost_id, :prefecture_id, :image, :name, :description, :shipping_days_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    # redirect_to action: :index unless user_signed_in?
    # if current_user == @item.user || @item.order != nil
    # 差分確認
    if @item.user_id != current_user.id || @item.order != nil
    redirect_to root_path
  end
 end
end
