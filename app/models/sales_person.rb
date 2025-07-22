class SalesPerson < ApplicationRecord
  validate :unique_sales_person
  validates :first_name, presence: true
  validates :last_name, presence: true
  
  has_many :sales_records

  private 

  def unique_sales_person
    if SalesPerson.where(first_name: first_name.capitalize, last_name: last_name.capitalize).exists?
      errors.add(:base, "This Sales Person already exists")
    end
  end
end
