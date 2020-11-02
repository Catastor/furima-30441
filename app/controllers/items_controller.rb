class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :mismatch_id, except: [:index, :new, :create, :show, :destroy]
  before_action :recommend_login, except: [:index, :show]
  before_action :set_item, only: [:create, :edit, :show, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
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
    item.destroy
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
    if user_signed_in? && current_user.id != @item.user_id
      redirect_to action: :index
    else
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def recommend_login
    redirect_to user_session_path unless user_signed_in?
  end
end
