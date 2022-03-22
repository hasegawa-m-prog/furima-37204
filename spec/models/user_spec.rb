require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
      context '新規登録できるとき' do
        it "nameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
          expect(@user).to be_valid
        end
         it 'passwordが6文字以上であれば登録できる' do
          @user.password = 'abc125'
          @user.password_confirmation = 'abc125'
          expect(@user).to be_valid
         end
      end
            
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したメールアドレスは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスに@を含まない場合は登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字未満では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが英字のみのパスワードでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'password数字のみのパスワードでは登録できない' do
        @user.password = '012345'
        @user.password_confirmation = '012345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = '012345'
        @user.password_confirmation = '012345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '姓（全角）が空だと登録できない' do
        @user.name_sei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name sei can't be blank")
      end
      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.name_sei = 'hannkakumoji'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name sei is invalid. Input full-width characters.")
      end
      it '名（全角）が空だと登録できない' do
        @user.name_mei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name mei can't be blank")
      end
      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.name_mei = 'hannkakumoji'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name mei is invalid. Input full-width characters.")
      end
      it '姓（カナ）が空だと登録できない' do
        @user.kana_sei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana sei can't be blank")
      end
      it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.kana_sei = 'あ意ウえお'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana sei 全角カタカナを使用してください")
      end
      it '名（カナ）が空だと登録できない' do
        @user.kana_mei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana mei can't be blank")
      end
      it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.kana_mei = 'あ意ウえお'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana mei 全角カタカナを使用してください")
      end
      it '生年月日が空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
