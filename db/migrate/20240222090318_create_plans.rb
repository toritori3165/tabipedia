class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
      t.string :plan_title,  null: false
      t.text :content,       null: false
      t.references :trip,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
