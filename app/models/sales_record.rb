class SalesRecord < ApplicationRecord
  belongs_to :sales_person
  validates :sell_date, presence: true
end
