class RemoveSubjectsFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :subjects, :text
  end
end
