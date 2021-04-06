class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_order
  before_action :set_order
  def index
    @order = SellitemAddress.new
  end

  def create
    @order = SellitemAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:sellitem_address).permit(:postal_code, :region_id, :town, :numbering, :building, :telephone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def item_order
    @item = Item.find(params[:item_id])
  end

  def set_order
    if current_user == @item.user && @item.purchase.present?
      redirect_to root_path
    end
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
