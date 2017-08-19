class ChangeColumnInAdditionalComments < ActiveRecord::Migration[5.0]
  def change
  	change_column :additional_comments, :comment_id, :decimal, precision: 9, scale: 2
  end
end
