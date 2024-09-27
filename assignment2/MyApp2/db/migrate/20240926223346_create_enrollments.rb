class CreateEnrollments < ActiveRecord::Migration[7.2]
  def change
    create_table :enrollments do |t|
      t.integer :user_id, null: false
      t.integer :course_id, null: false
      t.integer :progress

      t.timestamps
    end

    add_foreign_key :enrollments, :users, column: :user_id
    add_foreign_key :enrollments, :courses, column: :course_id
  end
end
