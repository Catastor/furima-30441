require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全ての要素が存在する時、登録が行える' do
      expect(@user).to be_valid
    end

    it 'nicknameが空の時、登録することはできない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空の時、登録することはできない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailが重複する時、登録することはできない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailに@が含まれていない時、登録することはできない' do
      @user.email = 'samplesample.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが空の時、登録することはできない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下の時、登録することはできない' do
      @user.password = 'aaa11'
      @user.password_confirmation = 'aaa11'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが半角英数字を組み合わせたものでなければ登録することはできない(英字のみ)' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password include both letters and numbers')
    end

    it 'passwordが半角英数字を組み合わせたものでなければ登録することはできない(数字のみ)' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password include both letters and numbers')
    end

    it 'passwordはconfirmationと値が一致しなければならず、必ず両方とも入力していなければ登録することはできない' do
      @user.password = '123abc'
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'last_nameが空の時、登録することはできない' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_nameが空の時、登録することはできない' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_nameが漢字、平仮名、片仮名以外の時、登録することはできない' do
      @user.last_name = 'ono'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name Full-Width characters')
    end

    it 'first_nameが漢字、平仮名、片仮名以外の時、登録することはできない' do
      @user.first_name = 'youko'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Full-Width characters')
    end

    it 'last_furiganaが空の時、登録することはできない' do
      @user.last_furigana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last furigana can't be blank")
    end

    it 'first_furiganaが空の時、登録することはできない' do
      @user.first_furigana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First furigana can't be blank")
    end

    it 'last_furiganaがカタカナ以外の時、登録することはできない' do
      @user.last_furigana = '小野'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last furigana Full-width katakana characters')
    end

    it 'first_furiganaがカタカナ以外の時、登録することはできない' do
      @user.first_furigana = '洋子'
      @user.valid?
      expect(@user.errors.full_messages).to include('First furigana Full-width katakana characters')
    end

    it 'birthdayが空の時、登録することはできない' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
