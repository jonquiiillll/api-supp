class CreateTaggings < ActiveRecord::Migration[7.0]
  def change
    create_table :taggings do |t|
      t.belongs_to :tag, foreign_key: false
      t.belongs_to :user, foreign_key: false

      t.timestamps
    end
  end
end
