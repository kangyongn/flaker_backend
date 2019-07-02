class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.integer :creator_id
      t.string :name
      t.integer :cost
      t.boolean :end, default: false

      t.timestamps
    end
  end
end
