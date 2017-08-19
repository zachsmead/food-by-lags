class CreateTexts < ActiveRecord::Migration[5.0]
  def change
    create_table :texts do |t|
      t.string :name
      t.string :text
      t.decimal :comment_id
      t.boolean :approved

      t.timestamps
    end
  end
end
