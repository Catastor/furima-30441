class OrdersController < ApplicationController

  def index
    @purchase_info = PurchaseInfo.new
    @item = Item.find(params[:item_id])
  end

  def new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_info = PurchaseInfo.new(purchase_params)
      if @purchase_info.valid?
        pay_item
        @purchase_info.save
        redirect_to root_path
      else
        render action: :index
      end
  end

  private

  def purchase_params
    params.permit(:postal_code, :shipment_source_id, :municipalities, :house_number, :building, :phone_number, :item_id, :token).merge(token: params[:token] ,user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

end
