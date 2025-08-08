class Item < ApplicationRecord
  before_create :unique_item
  validates :name, presence: true

  has_many :sales_records

  private

  def unique_item
    if Item.where("LOWER(name) = ?", name.downcase).exists?
      errors.add(:base, "This Item already exists")
      throw(:abort)
    end
  end
end