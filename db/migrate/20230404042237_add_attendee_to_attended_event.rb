class AddAttendeeToAttendedEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :attended_events, :attendee_id, :integer, index: true
    add_foreign_key :attended_events, :users, column: :attendee_id
  end
end
