class Item < ApplicationRecord
  validate :unique_item
  validates :name, presence: true

  has_many :sales_records

  private

  def unique_item
    if Item.where(name: name.titleize).exists?
      errors.add(:base, "This Item already exists")
    end
  end
end