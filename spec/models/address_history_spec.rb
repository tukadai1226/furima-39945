require 'rails_helper'

RSpec.describe AddressHistory, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @address_history = FactoryBot.build(:address_history, user_id: user.id, item_id: item.id)
    end

    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@address_history).to be_valid
      end
      it 'building_nameは空でも保存ができる' do
        @address_history.building_name = ''
        expect(@address_history).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @address_history.post_code = ''
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ形式でないと保存できないこと' do
        @address_history.post_code = '1234567'
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'cityが空だと保存ができない' do
        @address_history.city = ''
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存ができない' do
        @address_history.address = ''
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephoneが空だと保存ができない' do
        @address_history.telephone = ''
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'teleponeがハイフンを含んでいる場合は登録できない' do
        @address_history.telephone = 0o00 - 0o000 - 0o000
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include('Telephone is invalid')
      end
      it 'telephoneが10桁以下では保存ができなこと' do
        @address_history.telephone = 0o00000000
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include('Telephone is invalid')
      end
      it 'telephoneが11桁以上では保存ができなこと' do
        @address_history.telephone = 0o00000000000
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include('Telephone is invalid')
      end
      it 'telephoneが半角数字でないと保存できないこと' do
        @address_history.telephone = 'あああああああああああ'
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include('Telephone is invalid')
      end
      it 'tokenが空だと保存ができない' do
        @address_history.token = ''
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("Token can't be blank")
      end
      it 'prefecture_idが「---」が選択されている場合は出品できない' do
        @address_history.prefecture_id = 1
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @address_history.user_id = nil
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存ができないこと' do
        @address_history.item_id = nil
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
