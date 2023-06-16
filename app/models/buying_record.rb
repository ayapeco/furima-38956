class BuyingRecord < ApplicationRecord
attr_accessor :token
has_one :shipping
belongs_to :user
belongs_to :item

end
