class CreatePhrases < ActiveRecord::Migration[8.0]
  def change
    create_table :phrases do |t|
      t.string :name
      t.text :explanation
      t.text :examples

      t.timestamps
    end
  end
end
