class DropCookinghistory < ActiveRecord::Migration[5.1]
  def change
    drop_table :cookinghistories
  end
end
