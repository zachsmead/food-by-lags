class CreateAdditionalComments < ActiveRecord::Migration[5.0]
  def change
    create_table :additional_comments do |t|
      t.string :name
      t.string :text
      t.integer :comment_id
      t.boolean :approved

      t.timestamps
    end
  end
end
