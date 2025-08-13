class Item < ApplicationRecord
  before_create :unique_item
  before_destroy :find_sales_records
  validates :name, presence: true

  has_many :sales_records

  private

  def find_sales_records
    if sales_records.exists?
      errors.add(:base, "There are Sales Records with this Item")
      throw(:abort)
    end
  end
  
  def unique_item
    if Item.where("LOWER(name) = ?", name.downcase).exists?
      errors.add(:base, "This Item already exists")
      throw(:abort)
    end
  end
end