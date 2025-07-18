class SalesRecord < ApplicationRecord
  belongs_to :sales_person
  belongs_to :item
  validates :sell_date, presence: true
end
