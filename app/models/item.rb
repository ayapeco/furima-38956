class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  #has_one :buying_record
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :shipping_region
  belongs_to :shipping_time
  has_one_attached :image

  validates :items_name, presence: true
  validates :items_description, presence: true
  validates :category, presence: true
  validates :condition, presence: true
  validates :shipping_fee, presence: true
  validates :shipping_region, presence: true
  validates :shipping_time, presence: true
  validates :items_price, presence: true

  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :shipping_fee_id, numericality: { other_than: 1 } 
  validates :shipping_region_id, numericality: { other_than: 1 } 
  validates :shipping_time_id, numericality: { other_than: 1 } 

end


