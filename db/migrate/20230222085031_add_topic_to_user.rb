class AddTopicToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :topic, :string
  end
end
