class SalesPerson < ApplicationRecord
  validate :unique_sales_person
  before_destroy :find_sales_records
  validates :first_name, presence: true
  validates :last_name, presence: true
  
  has_many :sales_records

  private 

  def find_sales_records
    if sales_records.exists?
      errors.add(:base, "There are Sales Records for this Sales Person")
      throw(:abort)
    end
  end

  def unique_sales_person
    if SalesPerson.where(first_name: first_name.capitalize, last_name: last_name.capitalize).exists?
      errors.add(:base, "This Sales Person already exists")
    end
  end
end
