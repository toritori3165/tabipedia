class CreatePlanComments < ActiveRecord::Migration[7.0]
  def change
    create_table :plan_comments do |t|
      t.integer :user_id
      t.integer :plan_id
      t.text :text
      t.timestamps
    end
  end
end
