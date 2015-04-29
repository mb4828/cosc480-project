class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name, limit: 30
      t.string :description, limit: 30
      t.boolean :sunday
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.string :start_time, limit: 8
      t.string :end_time, limit: 8
      t.string :color, limit: 8
      t.integer :ordering
      t.integer :schedule_id, limit: 10
      t.timestamps null: false
    end
  end
end
