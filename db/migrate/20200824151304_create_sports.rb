class CreateSports < ActiveRecord::Migration[6.0]
  def change
    create_table :sports do |t|
      t.string :name
      t.text :description
      t.string :address

      t.timestamps
    end
  end
end
