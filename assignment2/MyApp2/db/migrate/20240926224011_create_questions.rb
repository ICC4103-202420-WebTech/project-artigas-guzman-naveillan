class CreateQuestions < ActiveRecord::Migration[7.2]
  def change
    create_table :questions do |t|
      t.text :content
      t.references :user, null: false
      t.references :lesson, null: false

      t.timestamps
    end

    add_foreign_key :questions, :users, column: :user_id
    add_foreign_key :questions, :lessons, column: :lesson_id
  end
end
