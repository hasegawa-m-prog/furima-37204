require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
      context '画像が登録できるとき' do
        it "itemが存在すれば登録できる" do
          expect(@item).to be_valid
        end
      end
            
    context '商品出品ができないとき' do
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it '画像が空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では登録できない' do
        @item.product = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product can't be blank")
      end
      it '商品の説明が空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーIDが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'カテゴリーIDが数字以外では登録できない' do
        @item.category_id = 'あ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category 選択が間違えています")
      end
      it 'カテゴリーIDが2以上のidで選択されないと保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category 選択が間違えています")
      end
      it 'ステータスIDが空では登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'ステータスIDが数字以外では登録できない' do
        @item.status_id = 'あ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status 選択が間違えています")
      end
      it 'ステータスIDが2以上のidで選択されないと保存できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status 選択が間違えています")
      end
      it '配送料負担のIDが空では登録できない' do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it '配送料負担のIDが数字以外では登録できない' do
        @item.postage_id = 'あ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage 選択が間違えています")
      end
      it '配送料負担のIDが2以上のidで選択されないと保存できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage 選択が間違えています")
      end
      it '配送元地域のIDが空では登録できない' do        
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture 選択が間違えています")
      end
      it '配送元地域のIDが数字以外では登録できない' do
        @item.prefecture_id = 'あ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture 選択が間違えています")
      end
      it '配送元地域のIDが2以上のidで選択されないと保存できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture 選択が間違えています")
      end
      it '発送までの日数のIDが空では登録できない' do        
        @item.delivery_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank", "Delivery day 選択が間違えています")
      end
      it '配送元地域のIDが数字以外では登録できない' do
        @item.delivery_day_id = 'あ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day 選択が間違えています")
      end
      it '配送元地域のIDが数字以外では登録できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day 選択が間違えています")
      end
      it '価格が空では登録できない' do        
        @item.price = ''
        @item.valid?
         expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number", "Price is not included in the list")
      end
      it '価格の数字が300..9999999以外では登録できない' do
        @item.price = '01'
        @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '価格は半角数字以外の値が含まれている場合は保存できない' do
        @item.price = 'あ'
        @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '価格は10000000以上の値では保存できない' do
        @item.price = 100000000
        @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end