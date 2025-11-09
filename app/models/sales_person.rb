class SalesPerson < ApplicationRecord
  validate :unique_sales_person
  before_destroy :find_records
  validates :first_name, presence: true
  validates :last_name, presence: true
  
  has_many :sales_records
  has_many :shifts

  private 

  def find_records
    if sales_records.exists? or shifts.exists?
      errors.add(:base, "There are Sales Records or Shifts for this Sales Person")
      throw(:abort)
    end
  end

  def unique_sales_person
    if SalesPerson.where(first_name: first_name.capitalize, last_name: last_name.capitalize).exists?
      errors.add(:base, "This Sales Person already exists")
    end
  end
end
