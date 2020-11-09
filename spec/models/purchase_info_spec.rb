require 'rails_helper'

RSpec.describe PurchaseInfo, type: :model do
  before do
    @purchase_info = FactoryBot.build(:purchase_info)
  end

  it '建物名以外の値が入力されていれば保存できる' do
    expect(@purchase_info).to be_valid
  end

  it 'tokenが空では保存できない' do
    @purchase_info.token = nil
    @purchase_info.valid?
    expect(@purchase_info.errors.full_messages).to include("Token can't be blank")
  end

  it '郵便番号が空では保存できない' do
    @purchase_info.postal_code = nil
    @purchase_info.valid?
    expect(@purchase_info.errors.full_messages).to include("Postal code can't be blank")
  end

  it '郵便番号にハイフンがなければでは保存できない' do
    @purchase_info.postal_code = '1231234'
    @purchase_info.valid?
    expect(@purchase_info.errors.full_messages).to include('Postal code Input correctly')
  end

  it '郵便番号は数字でなければ保存できない' do
    @purchase_info.postal_code = '１２３-１２３４'
    @purchase_info.valid?
    expect(@purchase_info.errors.full_messages).to include('Postal code Input correctly')
  end

  it '都道府県を選択しなければ保存できない(:id 1は選択できない)' do
    @purchase_info.shipment_source_id = '1'
    @purchase_info.valid?
    expect(@purchase_info.errors.full_messages).to include('Shipment source Select')
  end

  it '市町村が空では保存できない' do
    @purchase_info.municipalities = nil
    @purchase_info.valid?
    expect(@purchase_info.errors.full_messages).to include("Municipalities can't be blank")
  end

  it '番地が空では保存できない' do
    @purchase_info.house_number = nil
    @purchase_info.valid?
    expect(@purchase_info.errors.full_messages).to include("House number can't be blank")
  end

  it '電話番号が空では保存できない' do
    @purchase_info.phone_number = nil
    @purchase_info.valid?
    expect(@purchase_info.errors.full_messages).to include("Phone number can't be blank")
  end

  it '電話番号は数値でないと保存できない' do
    @purchase_info.phone_number = '１２３１２３４１２３４'
    @purchase_info.valid?
    expect(@purchase_info.errors.full_messages).to include('Phone number Input only number')
  end

  it '電話番号はハイフンがある場合、12桁以上の場合は保存できない' do
    @purchase_info.phone_number = '123-1234-1234'
    @purchase_info.valid?
    expect(@purchase_info.errors.full_messages).to include('Phone number Input only number')
  end

end
