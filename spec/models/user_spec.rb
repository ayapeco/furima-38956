require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザ登録ができる時' do
    describe 'ユーザー新規登録' do
      it 'email、first_name, family_name, first_name_kana, family_name_kana, nickname, birthday, password, password_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'first_nameとfamily_nameが全角であれば登録できる' do
        @user.first_name = '太郎'
        @user.family_name = '山田'
        expect(@user).to be_valid
      end
      it 'first_name_kanaとfamily_name_kanaが全角であれば登録できる' do
        @user.first_name_kana = 'タロウ'
        @user.family_name_kana = 'ヤマダ'
        expect(@user).to be_valid
      end
      it 'パスワードが半角英数混合であれば登録できる' do
        @user.password = 'aaa123'
        @user.password_confirmation = 'aaa123'
        expect(@user).to be_valid
      end
    end

    context 'ユーザ登録ができない時' do
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
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
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end

      it 'パスワードが英語のみでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
      end
      it 'パスワードが数字のみでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
      end
      it 'パスワードが全角では登録できない' do
        @user.password = 'あいうえお１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
      end
      it '姓（全角）に半角文字が含まれていると登録できない ' do
        @user.family_name = 'abcde'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end
      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.first_name = 'abcde'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.family_name_kana = 'あ小123@'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid')
      end
      it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.first_name_kana = 'あ小123@'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
    end
  end
end
