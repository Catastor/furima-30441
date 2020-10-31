class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @category = Category.data.detect{ |s| s[:id] == @item.category_id }
    @status = Status.data.detect{ |s| s[:id] == @item.status_id }
    @delivery_charge = DeliveryCharge.data.detect{ |s| s[:id] == @item.delivery_charge_id }
    @shipment_source = ShipmentSource.data.detect{ |s| s[:id] == @item.shipment_source_id }
    @date_of_shipment = DateOfShipment.data.detect{ |s| s[:id] == @item.date_of_shipment_id }
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :price, :category_id, :status_id, :delivery_charge_id, :shipment_source_id, :date_of_shipment_id).merge(user_id: current_user.id)
  end

end
