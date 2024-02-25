class AddCommentToLists < ActiveRecord::Migration[7.1]
  def change
    add_column :lists, :comment, :text
  end
end
