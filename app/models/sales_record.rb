class SalesRecord < ApplicationRecord
  belongs_to :sales_person
  belongs_to :item
  validates :sell_date, presence: true
  validates :item_id, presence: true
  validates :item_price, presence: true
end
