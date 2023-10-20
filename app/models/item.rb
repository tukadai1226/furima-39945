class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  has_one_attached :image

  belongs_to :category
  belongs_to :condition
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :estimated_shopping_date

  NUM_REGEX = /\A[0-9]+\z/
  validates :prece, format: { with: NUM_REGEX }, numericality: {greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999}

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :burden_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :estimated_shopping_date_id, numericality: { other_than: 1 , message: "can't be blank"}

  validates :item, presence: true, length: { maximum: 40 }
  validates :explanation, presence: true, length: { maximum: 1000 }
  validates :image, presence: true
  validates :prece, presence: true
end
