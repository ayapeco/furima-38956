class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :shipping_region
  belongs_to :shipping_time
  has_one_attached :image
  has_one :buying_record

  validates :items_price, presence: true

  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :shipping_fee_id, numericality: { other_than: 1 }
  validates :shipping_region_id, numericality: { other_than: 1 }
  validates :shipping_time_id, numericality: { other_than: 1 }

  with_options presence: true do
    validates :image
    validates :items_name
    validates :items_description
    validates :items_price, inclusion: { in: 300..9_999_999 }, numericality: { only_integer: true }
  end
  end
