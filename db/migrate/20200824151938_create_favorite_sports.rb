class CreateFavoriteSports < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_sports do |t|
      t.references :user, null: false, foreign_key: true
      t.references :sport, null: false, foreign_key: true

      t.timestamps
    end
  end
end
