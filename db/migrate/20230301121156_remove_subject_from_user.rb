class RemoveSubjectFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :subject, :text
  end
end
