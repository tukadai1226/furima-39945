require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      context '新規登録できない時' do
        it 'nicknameが空では登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'passwordとpassword_confirmationが不一致では登録できない' do
          @user.password = 'd123456'
          @user.password_confirmation = 'd1234567'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it '重複したemailが存在する場合は登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it 'emailは@を含まないと登録できない' do
          @user.email = 'testmail'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end
        it 'passwordが5文字以下では登録できない' do
          @user.password = 'd1234'
          @user.password_confirmation = 'd1234'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
        it 'passwordが半角英数字混合でないと登録できない' do
          @user.password = '123456'
          @user.password_confirmation = '123456'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end
        it '英字のみのパスワードでは登録できない' do
          @user.password = 'aaaaaa'
          @user.password_confirmation = 'aaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end
        it '数字のみのパスワードでは登録できない' do
          @user.password = '111111'
          @user.password_confirmation = '111111'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end
        it '全角文字を含むパスワードでは登録できない' do
          @user.password = 'あ11111'
          @user.password_confirmation = 'D11111'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end
        it '名字が空では登録できない' do
          @user.family_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name can't be blank")
        end
        it '名前が空では登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it '名字に半角文字が含まれていると登録できない' do
          @user.family_name = 'あいうえa'
          @user.valid?
          expect(@user.errors.full_messages).to include('Family name is invalid')
        end
        it '名前に半角文字が含まれていると登録できない' do
          @user.first_name = 'あいうえa'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name is invalid')
        end
        it '名字のカナが空では登録できない' do
          @user.family_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana can't be blank")
        end
        it '名前のカナが空では登録できない' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end
        it '名字のカナがカタカナでないと登録できない' do
          @user.family_name_kana = 'あいうえ'
          @user.valid?
          expect(@user.errors.full_messages).to include('Family name kana is invalid')
        end
        it '名前のカナがカタカナでないと登録できない' do
          @user.first_name_kana = 'あいうえ'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name kana is invalid')
        end
        it '生年月日が空では登録できない' do
          @user.birthday = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
    end
  end
end
