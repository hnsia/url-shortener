class AddCoordsToVisits < ActiveRecord::Migration[7.0]
  def change
    add_column :visits, :geocoordinates, :string
  end
end
