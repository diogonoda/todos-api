class AddPictureToTodos < ActiveRecord::Migration[5.0]
  def change
    add_column :todos, :picture, :string
  end
end
