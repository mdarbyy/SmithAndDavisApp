class Item < ApplicationRecord
  has_many :sales_records
  validates :name, presence: true, uniqueness: true
end
