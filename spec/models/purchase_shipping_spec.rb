require 'rails_helper'

RSpec.describe  PurchasesShipping, type: :model do
  describe '購入者情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_shipping = FactoryBot.build(:purchases_shipping, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_shipping).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchase_shipping.building = ''
        expect(@purchase_shipping).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postcodeは空だと保存できないこと' do
        @purchase_shipping.postcode = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postcode can't be blank", "Postcode is invalid. Include hyphen(-)")
      end
      it 'postcodeは「3桁ハイフン4桁」の半角文字列のみでないと保存できないこと' do
        @purchase_shipping.postcode = '1234567'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @purchase_shipping.prefecture_id = 0
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Prefecture can't be blank")
            end
      it 'municipalityは空だと保存できないこと' do
        @purchase_shipping.municipality = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressは空だと保存できないこと' do
        @purchase_shipping.address = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号は10桁以上11桁以内の半角数値のみではないと保存できないこと' do
        @purchase_shipping.phone = '090-1234-5678'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone 10桁以上11桁以内の半角数値のみで記載すること")
      end  
      it "tokenが空では登録できないこと" do
        @purchase_shipping.token = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
      end
      it '電話番号は空では購入できないこと' do
        @purchase_shipping.phone = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone can't be blank")
      end
      it '電話番号は9桁以下では購入できない' do
        @purchase_shipping.phone = '090123456'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone 10桁以上11桁以内の半角数値のみで記載すること")
      end
      it '電話番号は12桁以上では購入できない' do
        @purchase_shipping.phone = '090-1234-567'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone 10桁以上11桁以内の半角数値のみで記載すること")
      end
      it 'userが空では購入できないこと' do
        @purchase_shipping.user_id = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが空では購入できないこと' do
        @purchase_shipping.item_id = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end