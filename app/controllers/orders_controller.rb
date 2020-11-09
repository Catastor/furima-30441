class OrdersController < ApplicationController
  before_action :set_item
  before_action :recommend_login
  before_action :mismatch_id
  before_action :sold_out

  def index
    @purchase_info = PurchaseInfo.new
  end

  def create
    @purchase_info = PurchaseInfo.new(purchase_params)
    if @purchase_info.valid?
      pay_item
      @purchase_info.save
      @item.update( buyed: current_user.id )
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_info).permit(:postal_code, :shipment_source_id, :municipalities, :house_number, :building, :phone_number).merge(token: params[:token] ,user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def recommend_login
    redirect_to user_session_path unless user_signed_in?
  end

  def mismatch_id
    set_item
    if user_signed_in? && current_user.id == @item.user_id || @item.buyed.present?
      redirect_to root_path
    end
  end

end
