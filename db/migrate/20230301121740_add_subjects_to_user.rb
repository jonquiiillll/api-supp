class AddSubjectsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :subjects, :text, array: true, default: []
  end
end
