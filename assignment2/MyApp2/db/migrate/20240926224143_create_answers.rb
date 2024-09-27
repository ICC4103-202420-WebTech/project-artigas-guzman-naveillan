class CreateAnswers < ActiveRecord::Migration[7.2]
  def change
    create_table :answers do |t|
      t.text :content
      t.references :user, null: false
      t.references :question, null: false

      t.timestamps
    end

    add_foreign_key :answers, :users, column: :user_id
    add_foreign_key :answers, :questions, column: :question_id
  end
end
