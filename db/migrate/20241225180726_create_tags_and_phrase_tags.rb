class CreateTagsAndPhraseTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :name, null: false, unique: true

      t.timestamps
    end

    create_table :phrase_tags do |t|
      t.references :phrase, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
