class Shift < ApplicationRecord
  belongs_to :sales_person

  belongs_to :sales_person

  validates :shift_date, presence: true
  validates :sales_floor_hours,presence: true, numericality: { greater_than_or_equal_to: 0.1, less_than_or_equal_to: 24 }

  before_create :ensure_one_shift_per_day
  before_update :ensure_one_shift_per_day

  private

  def ensure_one_shift_per_day
    if Shift.exists?(sales_person_id: sales_person_id, shift_date: shift_date)
      errors.add(:base, "A shift for this Sales Person already exists for this date")
      throw(:abort)
    end
  end
end