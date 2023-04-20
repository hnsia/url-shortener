class CreateVisits < ActiveRecord::Migration[7.0]
  def change
    create_table :visits do |t|
      t.references :url, null: false, foreign_key: true
      t.string :geolocation

      t.timestamps
    end
  end
end
