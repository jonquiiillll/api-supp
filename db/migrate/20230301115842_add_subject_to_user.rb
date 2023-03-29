class AddSubjectToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :subject, :text, array: true, default: []
  end
end
