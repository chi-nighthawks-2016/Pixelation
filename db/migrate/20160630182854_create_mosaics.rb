class CreateMosaics < ActiveRecord::Migration
  def change
    create_table :mosaics do |t|
      t.string :picture_url
      t.string :search_query
      t.string :mosaic_id
      t.string :mosaic_url
      t.string :flickr_urls

      t.timestamps null: false
    end
  end
end
