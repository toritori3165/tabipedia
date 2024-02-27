class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.string :trip_title,  null: false
      t.string :place,       null: false
      t.date :start_date,    null: false
      t.date :end_date,      null: false
      t.float :latitude
      t.float :longitude
      t.references :user,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
