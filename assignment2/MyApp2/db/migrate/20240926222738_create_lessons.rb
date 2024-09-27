class CreateLessons < ActiveRecord::Migration[7.2]
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :content
      t.string :lesson_type
      t.integer :course_id, null: false
      
      t.timestamps
    end

    add_foreign_key :lessons, :courses, column: :course_id
  end
end
