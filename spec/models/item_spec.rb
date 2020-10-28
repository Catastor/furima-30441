require 'rails_helper'

RSpec.describe Item, type: :model do
  describe Item do
    before do
      @item = FactoryBot.build(:item)
    end
    it '商品画像を添付しなければ出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include( "Image can't be blank" )
    end

    it '商品名が空欄だと出品できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include( "Name can't be blank" )
    end

    it '商品説明が空欄だと出品できない' do
      @item.info = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end

    it 'カテゴリを選択しなければ出品できない' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select")
    end

    it '商品の状態を選択しなければ出品できない' do
      @item.status_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include( "Status Select" )
    end

    it '配送料の負担を選択していないと出品できない' do
      @item.delivery_charge_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include( 'Delivery charge Select' )
    end

    it '発送元の地域を選択していないと出品できない' do
      @item.shipment_source_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include( 'Shipment source Select' )
    end

    it '発送までの日数を選択しないと出品できない' do
      @item.date_of_shipment_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include( 'Date of shipment Select' )
    end

    it '価格を設定しなければ出品できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include( "Price can't be blank" )
    end

    it '価格には半角数字を使わなければ出品できない' do
      @item.price = "１０００"
      @item.valid?
      expect(@item.errors.full_messages).to include( "Price Half-width number" )
    end

    it '価格は300円〜999,9999円の範囲で設定しなければ出品できない(上限)' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include( "Price Out of setting range" )
    end

    it '価格は300円〜999,9999円の範囲で設定しなければ出品できない(下限)' do
      @item.price = '100'
      @item.valid?
      expect(@item.errors.full_messages).to include( "Price Out of setting range" )
    end
  end
end