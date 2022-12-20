class AddProblemToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :problems, :text, array: true, default: []
  end
end
