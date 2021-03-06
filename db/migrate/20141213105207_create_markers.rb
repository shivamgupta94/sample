class CreateMarkers < ActiveRecord::Migration
  def change
    create_table :markers do |t|
      t.decimal :lat, :precision => 20, :scale => 19
      t.decimal :long, :precision => 20, :scale => 19
      t.string :description
      t.references :rou, index: true

      t.timestamps
    end
  end
end
