class AddTroubleToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :trouble, null: true, foreign_key: true
  end
end
