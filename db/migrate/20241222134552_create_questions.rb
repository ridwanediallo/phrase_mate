class CreateQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :questions do |t|
      t.references :quiz, null: false, foreign_key: true
      t.references :phrase, null: false, foreign_key: true
      t.string :question_text
      t.string :correct_answer
      t.string :wrong_answers, array: true, default: []

      t.timestamps
    end
  end
end
