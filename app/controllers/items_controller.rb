class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :mismatch_id, only: [:edit, :update]
  before_action :recommend_login, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.order('created_at DESC')
    @buyers = Buyer.order('created_at DESC')
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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :price, :category_id, :status_id, :delivery_charge_id, :shipment_source_id, :date_of_shipment_id).merge(user_id: current_user.id)
  end

  def mismatch_id
    set_item
    redirect_to action: :index if user_signed_in? && current_user.id != @item.user_id
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def recommend_login
    redirect_to user_session_path unless user_signed_in?
  end
end
