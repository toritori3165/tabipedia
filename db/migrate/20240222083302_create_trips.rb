class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.string :trip_title
      t.string :place
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
  end
end
