class PurchasesShipping
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postcode, :prefecture_id, :municipality, :address, :building, :phone, :token

  with_options presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :municipality
    validates :address
    validates :phone, format: {with: /\A\d{10,11}\z/, message: "10桁以上11桁以内の半角数値のみで記載すること"}
    validates :user_id
    validates :item_id
    validates :token
  end

  def save 
    # 購入履歴を保存し、変数purchases代入する
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    # 発送先情報を保存する
    # purchases_idには、変数purchasesのidと指定する
    # binding.pry
    Shipping.create(postcode: postcode, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone: phone, purchase_id: purchase.id)
  end
end