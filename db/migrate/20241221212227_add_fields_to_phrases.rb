class AddFieldsToPhrases < ActiveRecord::Migration[8.0]
  def change
    add_column :phrases, :category, :string
    add_column :phrases, :difficulty_level, :string
    add_column :phrases, :tags, :string, array: true, default: []
    add_column :phrases, :related_phrases, :json
    add_column :phrases, :audio_url, :string
    add_column :phrases, :examples, :string, array: true, default: []
  end
end
