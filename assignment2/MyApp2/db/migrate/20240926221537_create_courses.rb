class CreateCourses < ActiveRecord::Migration[7.2]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.integer :teacher_id,  null: false

      t.timestamps
    end

    add_foreign_key :courses, :users, column: :teacher_id
  end
end
