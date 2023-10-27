class AddressHistory
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building_name, :telephone, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :address
    validates :telephone, format: { with: /\A(0{1}\d{10,11})\z/ }
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  def save
    # 購入履歴情報を保存し、変数historyに代入する
    history = History.create(item_id:, user_id:)
    # 住所を保存する
    ShoppingAddress.create(post_code:, prefecture_id:, city:, address:,
                           building_name:, telephone:, history_id: history.id)
  end
end
