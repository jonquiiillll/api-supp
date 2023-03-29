class DropTableProblem < ActiveRecord::Migration[7.0]
  def change
    drop_table :problems
  end
end
