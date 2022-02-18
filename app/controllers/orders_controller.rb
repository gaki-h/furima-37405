class OrdersController < ApplicationController
  # before_action :authenticate_user!, except: :index

  def index
    @order_destination = OrderDestination.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_destination = OrderDestination.new
    # if @order_destination.valid?
    # @order_destination.save
    # redirect_to root_path
  # else
  #   render action: :index
  end

  private

  def order_params
    params.permit(:post_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number, :order).merge(user_id: current_user.id)
  end
end
