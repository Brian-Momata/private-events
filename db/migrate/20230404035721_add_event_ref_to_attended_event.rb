class AddEventRefToAttendedEvent < ActiveRecord::Migration[7.0]
  def change
    add_reference :attended_events, :event, foreign_key: true, null: false
  end
end
