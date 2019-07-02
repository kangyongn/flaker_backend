class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.integer :wager
      t.float :payout
      t.integer :user_id
      t.integer :plan_id
      t.boolean :attending, default: false

      t.timestamps
    end
  end
end
