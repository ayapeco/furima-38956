class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :buying_record
  belong_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :shipping_region
  belongs_to :shipping_time
  has_one_attached :image

  validates :items_name, :string, presence: true
  validates :items_description, :text, presence: true
  validates :category, :integer, presence: true
  validates :condition, :integer, presence: true
  validates :shipping_fee, :integer, presence: true
  validates :shipping_region, :integer, presence: true
  validates :shipping_time, :integer, presence: true
  validates :items_price, :integer, presence: true

  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :shipping_fee_id, numericality: { other_than: 1 } 
  validates :shipping_region_id, numericality: { other_than: 1 } 
  validates :shipping_time_id, numericality: { other_than: 1 } 

end


