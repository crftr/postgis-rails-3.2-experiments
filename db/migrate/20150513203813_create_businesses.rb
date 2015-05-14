class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.point :latlong, geographic: true

      t.timestamps
    end
    add_index :businesses, :latlong, using: :gist
  end
end
