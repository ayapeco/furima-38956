class OrderShipping
  include ActiveModel::Model
  attr_accessor :zip_code, :shipping_region_id, :shipping_city, :shipping_street, :shipping_building, :phone, :user_id, :item_id

  with_options presence: true do
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_city
    validates :shipping_street
    validates :phone, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
    validates :item_id
    validates :user_id
    #validates :token
  end
    validates :shipping_region_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    buying_record = BuyingRecord.create(item_id: item_id, user_id: user_id)
    Shipping.create(zip_code: zip_code, shipping_region_id: shipping_region_id, shipping_city: shipping_city, shipping_street: shipping_street, shipping_building: shipping_building, phone: phone, buying_record_id: buying_record.id)
  end
end