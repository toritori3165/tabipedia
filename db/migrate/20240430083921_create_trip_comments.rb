class CreateTripComments < ActiveRecord::Migration[7.0]
  def change
    create_table :trip_comments do |t|
      t.integer :user_id
      t.integer :trip_id
      t.text :text
      t.timestamps
    end
  end
end
