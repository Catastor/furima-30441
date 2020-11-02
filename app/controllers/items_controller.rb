class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :mismatch_id, except: [:index, :new, :create, :show, :destroy]
  before_action :recommend_login, except: [:index, :show]

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
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :price, :category_id, :status_id, :delivery_charge_id, :shipment_source_id, :date_of_shipment_id).merge(user_id: current_user.id)
  end

  def mismatch_id
    item = Item.find(params[:id])
    if user_signed_in? && current_user.id != item.user_id
      redirect_to action: :index
    else
      redirect_to root_path
    end
  end

  def recommend_login
    redirect_to user_session_path unless user_signed_in?
  end
end
