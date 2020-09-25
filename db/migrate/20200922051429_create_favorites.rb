class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.references :cuisine, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
