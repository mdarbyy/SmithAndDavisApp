class Shift < ApplicationRecord
  belongs_to :sales_person
  validates :shift_date, presence: true
  validates :sales_floor_hours,presence: true, numericality: { greater_than_or_equal_to: 0.1, less_than_or_equal_to: 24 }

  before_update :ensure_one_shift_per_day
  before_create :ensure_one_shift_per_day

  private

  def ensure_one_shift_per_day
    # Only check if the date or salesperson changed (or if this is a new record)
    if new_record? || will_save_change_to_shift_date? || will_save_change_to_sales_person_id?
      if Shift.exists?(sales_person_id: sales_person_id, shift_date: shift_date)
        # If updating, exclude the current record from the check
        existing_shift = Shift.find_by(sales_person_id: sales_person_id, shift_date: shift_date)
        if existing_shift && existing_shift.id != id
          errors.add(:base, "A shift for this Sales Person already exists for this date")
          throw(:abort)
        end
      end
    end
  end

end