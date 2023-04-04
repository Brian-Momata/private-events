class CreateAttendedEventsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :attended_events do |t|

      t.timestamps
    end
  end
end
