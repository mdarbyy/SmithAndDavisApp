class SalesPerson < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :sales_records, dependent: :destroy
end
