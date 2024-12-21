class CreatePhrases < ActiveRecord::Migration[8.0]
  def change
    create_table :phrases do |t|
      t.string :text
      t.text :meaning
      t.text :examples

      t.timestamps
    end
  end
end
