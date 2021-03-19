class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @items = Item.create(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :explanation, :category_id, :state_id, :delivery_id, :region_id, :day_id, :price)
  end
end
