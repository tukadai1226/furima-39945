class History < ApplicationRecord
  belongs_to :user
  belongs_to :Item
  has_one :shopping_addresses
end
