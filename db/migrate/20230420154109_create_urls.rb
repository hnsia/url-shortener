class CreateUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :urls do |t|
      t.string :title
      t.string :target_url
      t.string :shortened_key

      t.timestamps
    end
  end
end
