class AddStopNoToMarkers < ActiveRecord::Migration
  def change
    add_column :markers, :stop_no, :integer
  end
end
