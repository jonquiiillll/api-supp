class AddUserRefToTheme < ActiveRecord::Migration[7.0]
  def change
    add_reference :themes, :user, foreign_key: true
  end
end