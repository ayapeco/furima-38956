class OrderShipping
  include ActiveModel::Model
  attr_accessor :zip_code, :shipping_region_id, :shipping_city, :shipping_street, :shipping_building, :phone, :buying_record, :user_id, :item_id
 
  with_options presence: true do
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :shipping_street
    validates :phone, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
    validates :token
  end
    validates :shipping_region_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    buying_record = BuyingRecord.create(item_id: item_id, user_id: user_id)
    Shipping.created(zip_code: zip_code, shipping_region_id: shipping_region_id, shipping_city: shipping_city, shipping_street: shipping_street, shipping_building: building_name, phone: phone, buying_record_id: buying_record.id)  end
end