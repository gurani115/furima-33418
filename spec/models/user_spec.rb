require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザ新規登録' do
    context '新規登録できるとき' do
      it '必須項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nicknameを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Emailを入力してください")
      end
      it '重複したemailは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Emailはすでに存在します")
      end
      it 'emailには@がないと登録できない' do
        @user.email = 'aaaabbbbcccc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Emailは不正な値です")
      end
      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwordを入力してください")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmationとPasswordの入力が一致しません")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Passwordは6文字以上で入力してください')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmationとPasswordの入力が一致しません")
      end
      it 'passwordが全角では登録できない' do
        @user.password = 'A0B0C0'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmationとPasswordの入力が一致しません")
      end
      it 'passwordが英語のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmationとPasswordの入力が一致しません")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First nameを入力してください")
      end
      it 'first_nameは全角ひらがな、漢字、カタカナ以外だと登録できない' do
        @user.first_name = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First nameは不正な値です")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last nameを入力してください")
      end
      it 'last_nameは全角ひらがな、漢字、カタカナ以外だと登録できない' do
        @user.last_name = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last nameは不正な値です")
      end
      it 'kana_first_nameが空では登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first nameを入力してください")
      end
      it 'kana_first_nameは全角カタカナ以外だと登録できない' do
        @user.kana_first_name = 'bb'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first nameは不正な値です")
      end
      it 'kana_last_nameが空では登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last nameを入力してください")
      end
      it 'kana_last_nameは全角カタカナ以外だと登録できない' do
        @user.kana_last_name = 'bb'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last nameは不正な値です")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthdayを入力してください")
      end
    end
  end
end
