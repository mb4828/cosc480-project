class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :user_id
      t.boolean :locked, default: false
      t.timestamps null: false
    end
  end
end
