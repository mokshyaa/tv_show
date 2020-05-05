class AddTimeSlotToShow < ActiveRecord::Migration[5.2]
  def change
    add_reference :shows, :time_slot, foreign_key: true
  end
end
