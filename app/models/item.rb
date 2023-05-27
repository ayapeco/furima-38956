class Item < ApplicationRecord- has_one :buying_record
  belong_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :shipping_time
  has_one_attached :image
end
