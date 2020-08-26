class AddCoordinatesToSports < ActiveRecord::Migration[6.0]
  def change
    add_column :sports, :latitude, :float
    add_column :sports, :longitude, :float
  end
end
