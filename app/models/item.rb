class Item < ApplicationRecord
  belongs_to :user
  # has_one :purchases
  has_one_attached :image

  validates :image, presence: true

  validates :product, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :postage_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_day_id, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates_inclusion_of :price, in:300..9999999,
  format: { with: /\A[0-9]+\z/, message: '半角数値を使用してください' }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :delivery_day

  
  validates :category_id, numericality: { other_than: 1,message: "選択が間違えています" } 
  validates :status_id, numericality: { other_than: 1,message: "選択が間違えています" } 
  validates :postage_id, numericality: { other_than: 1,message: "選択が間違えています" } 
  validates :prefecture_id, numericality: { other_than: 1,message: "選択が間違えています" } 
  validates :delivery_day_id, numericality: { other_than: 1,message: "選択が間違えています" } 
  

end